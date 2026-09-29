# ROOMSCAN_PLAN_2.md — dotažení proti REW a Dirac Live

Plán pro implementaci. Navazuje na [`ROOMSCAN_PLAN.md`](ROOMSCAN_PLAN.md) a na
stav popsaný v [`README.md`](README.md). Vznikl ze srovnání appky s REW (měřicí
software) a Dirac Live (korekční systém). Obsahuje jen to, co se dá udělat
s jedním nekalibrovaným mikrofonem telefonu a s přijímačem, který má ručně
zadávaný 15pásmový grafický EQ. Fázová korekce, smíšená fáze, integrace více
subwooferů a absolutní SPL bez kalibrace se **nedělají** a nemají se
předstírat.

## Pravidla, která platí pro každou etapu

- **Nevymýšlet data.** Fáze se zapisuje jen tam, kde skutečně existuje. Pod
  hranicí platnosti okna se nekreslí křivka, kreslí se hranice. SPL se
  označuje jako odhad, dokud není zadaná kalibrace.
- **Nad Schroederovou frekvencí se neekvalizuje.** `math.min(300, room.schroederFrequency)`
  zůstává stropem, viz `lib/room/design_report.dart`.
- **Řezat volně, zvedat sotva.** `maxBoostDb` v `generateEq` zůstává 3 dB.
- **DSP v Dartu nad `Float64List`**, FFT přes `fftea`. Žádný nový nativní kód
  ani plugin, pokud etapa výslovně neříká jinak.
- **UI texty česky, kód a komentáře anglicky**, jako dosud. Komentář říká
  *proč*, ne *co*.
- **Každá etapa přidává testy do `test/`** a končí zeleným `flutter analyze --no-fatal-infos`
  a `flutter test`. CI (`.github/workflows/ci.yml`) navíc staví debug APK a
  iOS bez podpisu, takže nic z etap nesmí rozbít nativní build.
- **Každá etapa aktualizuje README**: tabulku „Stav podle fází" a sekci „Co
  vědomě chybí". Když etapa něco z „vědomě chybí" dodělá, řádek se smaže.
- **Jedna etapa = jeden PR.** Commity po logických krocích, ne jeden velký.
- Session JSON má `format` verzi jen u AVR configu. Při změně `Measurement`
  nebo `Session` zachovat zpětné čtení starých souborů (`fromJson` s výchozími
  hodnotami), test na to existuje v `test/analysis_test.dart` u store.

## Pořadí etap

| # | Etapa | Proč v tomhle pořadí |
|---|---|---|
| 1 | Odezva: skutečná fáze, graf, vyhlazování, délka okna | Kód existuje, chybí napojení. Nejlevnější viditelný posun. |
| 2 | Kanály: měření per kanál, oprava párování, L vs R | Bez toho je EQ v appce mrtvý kód. |
| 3 | EQ: průměr z více bodů, náhled výsledku, editor cílové křivky | Staví na 1 a 2. Největší kus „Dirac-like" hodnoty. |
| 4 | Čas: RT60 po pásmech, EDT, C50/C80, graf impulzu a ETC | Nezávislé na 2 a 3, ale zpřesní `room.rt60` pro Schroedera. |
| 5 | Kalibrace: soubor mikrofonu, SPL offset v UI | Dotahuje `calibrationOffsetDb`, který se ukládá a nepoužívá. |
| 6 | Zkreslení ze sweepu | Farina ho dává zdarma, appka ho zahazuje. |
| 7 | RTA doplňky a srovnávací obrazovka | Pohodlí, ne nová schopnost. |
| 8 | Volitelné: spektrogram, generátor z telefonu | Jen pokud zbude čas. |

---

## Etapa 1 — Odezva: fáze, graf, vyhlazování, okno

### Stav

`ImpulseResponse.frequencyResponse()` v `lib/dsp/impulse_response.dart` vrací
jen magnitudu. `FrdExport.phaseDegrees` v `lib/export/frd.dart` existuje, ale
nikdo ji nevolá: `_exportFrd` v `lib/ui/impulse_screen.dart` posílá
`List<double>.filled(freqs.length, 0)`. README tvrdí, že export z gated
odezvy nese fázi. To je dnes nepravda.

Obrazovka Odezva ukazuje jen čísla a Schroederovu křivku. Graf frekvenční
odezvy se nikde nekreslí. Délka okna je natvrdo 5 ms.

### Co udělat

1. **Komplexní spektrum.** Přidat do `ImpulseResponse` metodu
   `complexResponse({int fftSize})`, která vrátí `(freqs, re, im)`. Stávající
   `frequencyResponse` ji zavolá a spočítá magnitudu, aby se nic nerozbilo.
   Před FFT posunout okno tak, aby přímý zvuk byl na indexu 0 (fáze se má
   vztahovat k příchodu přímého zvuku, ne k začátku nahrávky, jinak je v ní
   zabalený lineární sklon z latence přehrávání, který nic neříká).
2. **Fáze do FRD.** V `_exportFrd` použít `FrdExport.phaseDegrees(re, im)`.
   V hlavičce FRD napsat, že fáze je vztažená k přímému zvuku (minimální
   zpoždění odstraněno).
3. **Vyhlazování.** Nový soubor `lib/dsp/smoothing.dart` s
   `smoothFractionalOctave(freqs, levelsDb, {double fraction})` pro 1/3, 1/6,
   1/12, 1/24 oktávy. Průměrovat energii (ne dB) v okně ±fraction/2 oktávy
   kolem každého binu, na logaritmické ose. Pod hranicí `gatedResponseValidAbove`
   nevyhlazovat nic, protože tam není co.
4. **Graf odezvy** na obrazovce Odezva: nová widgeta
   `lib/ui/widgets/response_chart.dart` (CustomPaint, log osa X 20 Hz–20 kHz,
   Y v dB s rozsahem ±30 dB kolem mediánu). Dvě křivky: gated (přímý zvuk) a
   celá (s místností). Svislá čára na `gatedResponseValidAbove` s popiskem.
   Přepínač vyhlazování 1/3 … 1/24. Rozlišení Y a X musí sedět s tím, co
   později použije etapa 3 pro náhled EQ, takže widgeta bere seznam křivek
   s barvou a popiskem, ne jednu.
5. **Délka okna.** Slider 2–500 ms místo konstanty. Text u něj říká, že delší
   okno vidí níž, ale pustí dovnitř první odraz; nabídnout tlačítko „do
   prvního odrazu", které nastaví okno na `firstReflectionIndex − directSoundIndex`
   minus 0,5 ms, pokud odraz existuje.

### Testy (`test/dsp_test.dart`, nový `test/smoothing_test.dart`)

- Zpožděný jednotkový impuls o N vzorků: fáze po odstranění zpoždění je
  v toleranci 1° nula napříč pásmem. Bez odstranění je sklon fáze přesně
  −360·f·N/fs stupňů.
- Vyhlazení ploché křivky ji nezmění. Osamělý bin +20 dB se po 1/3-oktávovém
  vyhlazení sníží a rozšíří symetricky na log ose.
- Vyhlazování nesáhne pod `validAbove`.
- FRD z impulzu: řádky s fází nejsou všechny nulové, hlavička obsahuje
  „valid only above".

### Akceptace

Na syntetické nahrávce (sweep zpožděný o 20 ms a s jedním odrazem −10 dB na
+8 ms) obrazovka ukáže: hřebenový filtr v „celé" křivce, hladkou „gated"
křivku při okně 7 ms, hranici platnosti kolem 140 Hz, a FRD export otevřený
v REW má fázi blízko nule nad 200 Hz.

### Nedělat

Neposílat fázi z pásmových dat (`fromMeasurement` zůstává s nulou, důvod je
v README). Nekreslit vyhlazenou křivku pod hranicí okna.

---

## Etapa 2 — Kanály: měření per kanál, oprava párování, L vs R

### Stav

`buildDesignReport` v `lib/room/design_report.dart` staví
`byChannel = {for (m in measurements) m.id: m}` a `_eqFor` / `_levelFor`
hledají `byChannel[channel.name]`. Měření ale dostávají id `p1`, `p2`
(`lib/app_state.dart:255`) nebo časové razítko (`:207`). Klíč se nikdy
neshodne, takže v appce se EQ a level trim nikdy nevygenerují. Testy v
`test/room_test.dart` to nevidí, protože tam id rovnou pojmenovávají
`frontLeft`.

Session neukládá impulzní odezvu. Po restartu je pryč a `room.rt60` v
`lib/ui/design_screen.dart` spadne na výchozí 0,4 s.

### Co udělat

1. **`Measurement.channel`** (nullable `String`, hodnota `Channel.name`).
   `fromJson` bez klíče vrátí `null`. `byChannel` v `design_report.dart`
   klíčovat podle `channel`, ne `id`; body bez kanálu ignorovat pro EQ a
   trim, pro mapu a módy zůstávají.
2. **Souhrn impulzu v měření.** Nová třída `ImpulseSummary` v
   `lib/model/measurement.dart`: `arrivalMs`, `firstReflectionMs?`,
   `rt20?`, `rt30?`, `gateMs`, `gatedBandsDb` (31 pásem z gated odezvy přes
   `bandLevelsDb`). Ukládá se do JSON. Samotné vzorky impulzu se ukládají
   jako `float32` binární soubor vedle session (`<sessionId>_<pointId>.ir`)
   přes nové `SessionStore.writeImpulse` / `readImpulse`. JSON nese jen název
   souboru. Důvod: 10 s při 48 kHz je 1,9 MB, do JSONu to nepatří, ale bez
   něj nejde nic přepočítat.
3. **Průvodce měřením kanálů** na obrazovce Návrh: seznam kanálů z
   `_referenceLayout` (nebo z rozmístění, které uživatel upravil), u každého
   tlačítko „Změřit sweepem". Tok: nahrávat → pustit `sweep_<kanál>.wav` z
   počítače → Hotovo → deconvolveSweep → uložit `Measurement` s `channel`, s
   pozicí posluchače (AR pozice pokud běží, jinak `Vec3.zero`) a se souhrnem
   impulzu. `bandsDb` se počítá z *celé* odezvy (pro EQ pod Schroederem
   chceme místnost), `gatedBandsDb` z okna.
4. **Export sweepů per kanál** v `lib/ui/signals_screen.dart`: dnešní
   Mono / Jen levá / Jen pravá rozšířit na výběr kanálu z `Channel`. Pro
   stereo WAV to je L, R nebo oba; pro víc kanálů vyexportovat mono soubor
   pojmenovaný podle kanálu s poznámkou, že se pouští do daného vstupu
   přijímače přes multichannel WAV nebo z DAW. Ne vymýšlet 8kanálový WAV,
   pokud to `lib/signal/wav.dart` neumí triviálně (umí mono/stereo).
5. **Srovnání L vs R.** Na obrazovce Odezva (nebo nová záložka „Srovnání",
   viz etapa 7) překrýt gated a celé odezvy dvou vybraných kanálů v
   `response_chart` z etapy 1. Pod grafem: rozdíl příchodu v ms a v cm,
   rozdíl širokopásmové hladiny v dB, největší rozdíl v pásmech pod 300 Hz.
   Tohle je to, co README uvádí v „Co vědomě chybí".

### Testy (`test/room_test.dart`, `test/analysis_test.dart`)

- `buildDesignReport` s měřením `id: 'p1', channel: 'frontLeft'` vrátí EQ pro
  frontLeft. Stejné měření bez `channel` EQ nevrátí. Tohle je regresní test
  na dnešní chybu.
- Round-trip `Measurement` s `ImpulseSummary` a bez něj přes JSON.
- `SessionStore.writeImpulse` / `readImpulse` vrátí stejné vzorky v toleranci
  float32.
- Starý JSON bez `channel` a bez souhrnu se načte.

### Akceptace

Sken místnosti (body bez kanálu) plus dvě sweep měření (frontLeft, frontRight)
dají na obrazovce Návrh EQ preset pro oba kanály a na Odezvě překryv L/R.
Po restartu appky je session včetně impulzů zpět.

---

## Etapa 3 — EQ: více bodů, náhled výsledku, cílová křivka

### Stav

`generateEq` v `lib/export/avr_config.dart` bere jedno pole `measuredBandsDb`.
`TargetCurve` má dva presety a žádný editor. Výsledek EQ se nikde nesimuluje.

### Co udělat

1. **Prostorový průměr.** Nová funkce v `lib/analysis/heatmap.dart` nebo
   novém `lib/analysis/spatial_average.dart`:
   `spatialAverage(points, {Vec3 around, double radiusM = 1.0})` vrátí
   `(meanBandsDb, spreadBandsDb)`. Průměr energetický (jako `BandAverager`),
   rozptyl jako směrodatná odchylka v dB per pásmo. Body podle
   `planarDistanceTo`. Pokud je v okruhu míň než 3 body, vrátit průměr a
   označit `lowConfidence`.
2. **EQ z průměru s vahou podle rozptylu.** `generateEq` dostane volitelný
   `spreadBandsDb`. Pásmo, kde rozptyl mezi body přesáhne 6 dB, se koriguje
   jen z poloviny a dostane poznámku „liší se podle místa, EQ to nespraví".
   Tohle je jádro toho, co dělá Dirac s více pozicemi: nekorigovat, co se
   mění s místem.
3. **Model filtru Integry.** Nový `lib/dsp/graphic_eq.dart`:
   `graphicEqResponseDb(freqs, bands, gainsDb, {double q})`. Každé pásmo jako
   peaking biquad s pevným Q. Pásma Integry jsou rozestoupená po 2/3 oktávy,
   takže výchozí Q volit tak, aby se sousední pásma při stejném zisku
   sčítala na plochou křivku s vlněním pod 1 dB (spočítat testem, ne
   odhadem; vyjde kolem Q ≈ 2). Dokumentovat v komentáři, že skutečný filtr
   přijímače neznáme a tohle je aproximace.
4. **Náhled.** Na obrazovce Návrh pod EQ presetem graf ze `response_chart`:
   změřeno (průměr), cílová křivka, předpověď po EQ = změřeno + odezva
   filtru. Číslo pod tím: směrodatná odchylka od cíle v 40–300 Hz před a po.
   Pokud po EQ zůstane pásmo dál než 6 dB od cíle, vypsat, že je to
   interference a řeší se posunem (text už `generateEq` generuje, jen ho
   zobrazit u grafu).
5. **Editor cílové křivky.** `TargetCurve` uložit do session (nové pole
   `target`, výchozí hodnoty při chybějícím klíči). UI: čtyři slidery
   (zdvih basů dB, koleno Hz, sklon dB/okt, od Hz) a přepínač „plochá".
   Změna překreslí náhled okamžitě.
6. **Ověření druhým měřením.** Po zadání EQ do přijímače uživatel změří
   kanál znovu; měření dostane příznak `afterEq: true` a náhled ukáže tři
   křivky: před, předpověď, po. Rozdíl předpověď/po je jediná zpětná vazba,
   kterou o skutečném filtru Integry kdy dostaneme; zobrazit ho.

### Testy (`test/room_test.dart`, nový `test/eq_test.dart`)

- Prostorový průměr dvou bodů 0 dB a −20 dB dá −2,99 dB (energie), rozptyl
  10 dB.
- Pásmo s rozptylem nad práh dostane poloviční korekci a poznámku.
- Jedno pásmo +3 dB: odezva filtru v jeho středu je +3 ±0,2 dB, dvě oktávy
  vedle pod 0,3 dB.
- Všechna pásma +3 dB: výsledná křivka mezi 40 Hz a 10 kHz má vlnění pod
  1 dB. Tenhle test zároveň fixuje volbu Q.
- Předpověď po EQ má menší odchylku od cíle než před ním na syntetickém
  hrbu +8 dB na 63 Hz; na syntetickém propadu −12 dB na 100 Hz zůstane
  propad (boost je omezený) a vznikne poznámka.
- `TargetCurve` round-trip přes session JSON.

### Akceptace

Návrh z etapy 2 ukáže graf před/cíl/po a číslo, o kolik se odchylka zlepší.
Změna cílové křivky sliderem přepočítá preset i graf.

---

## Etapa 4 — Čas: RT60 po pásmech, EDT, C50/C80, graf impulzu a ETC

### Stav

`rt60()` je jedno širokopásmové číslo. `firstReflectionIndex` vrací jeden
odraz. Impulz ani ETC se nekreslí.

### Co udělat

1. **Pásmová filtrace impulzu.** Nový `lib/dsp/band_filter.dart`: oktávové
   pásmo 63 Hz–8 kHz filtrovat ve frekvenční oblasti (FFT, nulování mimo
   pásmo s kosinovými hranami ±1/6 oktávy, IFFT). Jednodušší a bez fázových
   artefaktů IIR; délka odezvy tomu dovoluje. Výsledek je `ImpulseResponse`,
   takže `rt60()` a `schroederCurveDb()` fungují beze změny.
2. **EDT** jako `rt60(decayDb: 10)` od 0 dB místo od −5 dB; přidat parametr
   `startDb`.
3. **C50 / C80** v `ImpulseResponse`: 10·log(energie do 50/80 ms po přímém
   zvuku / energie po). Širokopásmově i per pásmo.
4. **Tabulka** na obrazovce Odezva: řádky 63 … 8k, sloupce EDT, T20, T30,
   C50. Buňka „—", když pásmo nedoklesne (dnešní `null`). Poznámka pod
   tabulkou: v basech je RT60 telefonu spíš odhad, protože šum pozadí tam
   bývá nejblíž.
5. **`room.rt60` pro Schroedera** brát jako průměr T20 v pásmech 125–500 Hz,
   ne širokopásmový. `RoomGeometry` v `design_screen.dart` to dnes bere z
   `impulseResponse?.rt60()`, změnit na tento průměr, a při chybějícím měření
   zůstat na 0,4 s s poznámkou v UI, že Schroeder je odhad.
6. **Graf impulzu a ETC.** Do `response_chart` nepatří; nová widgeta
   `lib/ui/widgets/time_chart.dart`: osa X v ms od přímého zvuku (−2 … +200
   ms), přepínač impuls (lineárně) / ETC (20·log|h| s obálkou přes Hilbert,
   nebo prostě max v 0,1ms oknech; obálka přes maxima je pro tenhle účel
   dost a nepotřebuje komplexní FFT). Označit přímý zvuk a nalezený první
   odraz. Slider okna z etapy 1 se v tomhle grafu kreslí jako zvýrazněná
   oblast, aby bylo vidět, co okno bere.

### Testy (`test/dsp_test.dart`)

- Syntetické doznívání složené ze dvou pásem s RT 0,3 s (1 kHz) a 0,8 s
  (63 Hz): pásmové RT60 sedí do 0,1 s v obou.
- Pásmový filtr nepustí signál dvě oktávy mimo pásmo víc než −40 dB.
- C50 na impulzu bez odrazů je +∞ (nebo strop, řekněme 40 dB); s jedním
  odrazem −3 dB na 60 ms vychází 10·log(1/0,5) = 3 dB.
- EDT na ideálním exponenciálním doznívání se rovná T20.

### Akceptace

Odezva ukazuje tabulku po pásmech a graf ETC, kde je vidět přímý zvuk,
odraz a hranice okna. Návrh používá RT60 z 125–500 Hz.

---

## Etapa 5 — Kalibrace mikrofonu a SPL

### Stav

`Session.calibrationOffsetDb` se ukládá, ale žádné UI ho nenastavuje a
`FrdExport.fromMeasurement` ho dostane jen přes parametr `offsetDb`, který
nikdo nepředává. Kalibrační křivka neexistuje.

### Co udělat

1. **Kalibrační soubor.** Nový `lib/model/mic_calibration.dart`: parser
   textu „frekvence dB" po řádcích (formát miniDSP UMIK a REW, řádky s `*`
   nebo `#` jsou komentář; první řádek UMIKu s „Sens Factor" ignorovat).
   Interpolace na log ose. Uložit do session jako seznam bodů, ne odkaz na
   soubor.
2. **Import.** Přes `share_plus` importovat nejde; přidat plugin
   `file_picker` (jediná povolená nová závislost v tomto plánu). Tlačítko na
   obrazovce Analyzátor: „Kalibrace mikrofonu…". Po importu zobrazit rozsah
   korekce a počet bodů.
3. **Použití.** Korekce se **neaplikuje do `bandsDb`** (README: naměřená data
   zůstávají surová). Aplikuje se při zobrazení (RTA, mapa, odezva, náhled
   EQ) a při exportu (FRD hlavička napíše, že korekce byla použita a jaká).
   Jedno místo: `Session.correctedBands(Measurement)` a
   `Session.correctedCurve(freqs, levels)`.
4. **SPL offset.** Textové pole „Offset dB SPL" na Analyzátoru s vysvětlením:
   změř 1 kHz tón SPL metrem, zadej rozdíl. Když je nenulový, Analyzátor
   ukazuje „dB SPL (odhad)" místo dBFS. Bez něj zůstává dBFS.
5. **Předpřipravené křivky** nedělat. Telefony se liší kus od kusu a
   obecná křivka „iPhone" by byla přesně to vymýšlení, kterému se appka
   vyhýbá. Místo toho návod v UI: změř sweep telefonem a UMIKem ve stejném
   bodě, rozdíl exportuj z REW jako kalibrační soubor.

### Testy (nový `test/calibration_test.dart`)

- Parser čte UMIK formát včetně hlavičky a komentářů, REW formát, a odmítne
  soubor bez číselných řádků s chybou, ne prázdným výsledkem.
- Interpolace mezi 1 000 a 2 000 Hz na 1 414 Hz je přesně střed hodnot.
- `correctedBands` nemění `Measurement.bandsDb`.
- FRD s kalibrací má v hlavičce řádek o použité korekci a čísla se liší o
  korekci; bez ní zůstává dnešní výstup beze změny.

---

## Etapa 6 — Zkreslení ze sweepu

### Stav

`deconvolveSweep` zahazuje záporný čas před `offset`, kde podle Fariny leží
harmonické. Přebuzení tak jde poznat jen okem z impulzu.

### Co udělat

1. V `deconvolveSweep` neořezávat záporný čas okamžitě; vrátit celý výsledek
   v novém poli `ImpulseResponse.preRing` nebo nechat `deconvolveSweep`
   vracet dvojici (lineární odezva, záporný čas). Nezvětšovat paměť
   zbytečně: záporný čas stačí do vzdálenosti 5. harmonické.
2. `lib/dsp/distortion.dart`: n-tá harmonická leží před přímým zvukem o
   `Δt_n = L · ln(n)`, kde `L = LogSweep._rate` (zveřejnit jako `rate`).
   Vyříznout okno ±2 ms kolem každé, spočítat její spektrum, přemapovat
   frekvenci (n-tá harmonická na frekvenci f pochází z buzení f/n) a
   vyjádřit HD2, HD3 v dB pod základní.
3. Na obrazovce Odezva: řádek „THD při 100 Hz / 1 kHz" a varování, když je
   HD2 nebo HD3 nad −30 dB: buď příliš nahlas, nebo repro na hraně.
   Přebuzení je nejčastější chyba měření telefonem a tohle je jediný způsob,
   jak ho odlišit od odrazu.

### Testy (`test/signal_test.dart`)

- Nahrávka = sweep prohnaný `y = x + 0,1·x²`: HD2 vychází kolem −26 dB
  (0,1·A/2 vůči A při A = 0,5, tolerance 3 dB), HD3 pod −50 dB.
- Čistý sweep: HD2 i HD3 pod −60 dB.
- Harmonické se objeví přesně na `L·ln(2)` a `L·ln(3)` před přímým zvukem.

---

## Etapa 7 — RTA doplňky a srovnávací obrazovka

1. **RTA:** peak hold s dozníváním, přepínač max/min stopy, tlačítko
   „Zmrazit" a „Uložit jako bod" (uloží `Measurement` s aktuální AR pozicí
   nebo `Vec3.zero`). `BandAverager` v `lib/dsp/spectrum.dart` dostane
   `peakDb` a `minDb`.
2. **Srovnání:** nová záložka nebo sekce v Odezvě, kde jde vybrat libovolné
   body session (kanály, před/po EQ, dvě session) a překrýt je v
   `response_chart`. Rozdílová křivka A − B. Etapa 2 dělá jen L vs R,
   tady se to zobecní.
3. **Export všeho ze session** (mapa dnes exportuje FRD po bodech a JSON):
   přidat FRD z gated odezvy pro každý bod, který ji má, a `.ir` soubory.

Testy: `BandAverager.peakDb` drží maximum, `minDb` minimum, reset je vynuluje.

---

## Etapa 8 — Volitelné

- **Spektrogram / waterfall** impulzu: STFT nad odezvou, 20ms okna s 5ms
  krokem, kreslit jako heatmapu čas × frekvence. Ukazuje, které módy zvoní
  déle; RT60 po pásmech z etapy 4 říká totéž číslem, proto je to na konci.
- **Generátor z telefonu** (sinus, růžový šum) přes tenký platform channel
  s `AVAudioPlayerNode` / `AudioTrack`. README ho vědomě vynechává, protože
  reproduktor telefonu končí kolem 500 Hz. Pokud se dělá, pouze s textem v
  UI, že je to kontrola analyzátoru, ne měření místnosti, a nikdy ne jako
  `ExcitationSignal` pro session s mapou.

---

## Co se nedělá a proč

- **Fázová a časová korekce mezi kanály.** Integra bere jen vzdálenost s
  krokem 1 cm; to už `ChannelConfig.distanceM` dává. Cokoli dalšího vyžaduje
  externí DSP.
- **Parametrický EQ.** Přijímač ho nemá. FRD export do REW umožňuje
  uživateli spočítat PEQ pro miniDSP sám; to je správná dělba.
- **Integrace více subwooferů.** Bez fáze a bez druhého kanálu měření to
  nejde poctivě.
- **3D mrak bodů.** Plán 1 to vyřadil, důvod trvá.
- **Absolutní SPL bez zadání kalibrace.** Etapa 5 dává cestu, jak ji zadat;
  bez ní zůstává dBFS.

## Jak poznat, že je hotovo

Po etapách 1–5 by měla platit přeformulovaná akceptační kritéria z prvního
plánu, doplněná o:

1. FRD z gated odezvy otevřený v REW má fázi, která se v 200 Hz–10 kHz
   shoduje s měřením UMIKem do ±30° po odstranění zpoždění.
2. EQ preset zadaný do Integry zmenší odchylku od cíle v 40–300 Hz v
   posluchačském místě, a rozdíl mezi predikcí a skutečným měřením „po" je
   pod 2 dB v pásmech, kde se nekorigovalo nad 3 dB.
3. RT60 v pásmu 500 Hz se shoduje s REW do 15 %.

Tohle vyžaduje zařízení, bedny a UMIK. Dokud to neproběhne, platí totéž co
dnes: ověřená je matematika, ne měření.
