# ROOMSCAN_PLAN.md — 3D akustická mapa místnosti z mikrofonu mobilu

## Cíl

Mobilní appka (Flutter, iOS first), která z běžného telefonu udělá **akustickou sondu**: uživatel pustí z reproduktorů testovací signál, chodí s telefonem po místnosti, telefon si přes AR sleduje vlastní pozici a v každém bodě změří spektrum. Výsledkem je 3D/2D heatmapa, jak místnost zní na různých frekvencích.

Není to náhrada REW/kalibrovaného mikrofonu. Je to **relativní** nástroj: kde basy duní, kde mizí, kam dát bedny a posluchače.

## Co telefon umí a neumí (realistická omezení — respektovat v návrhu)

- Jeden mikrofon → **žádná lokalizace zdroje zvuku**. 3D vzniká výhradně z pohybu telefonu a AR trackingu pozice.
- Mikrofon není kalibrovaný, pásmo cca 50 Hz – 15 kHz, plochost ±5 dB. Všechna měření jsou **relativní** (dB vůči referenčnímu bodu), nikdy absolutní SPL bez kalibrace.
- **AGC / potlačení šumu / echo cancellation musí být vypnuté.** iOS: `AVAudioSession` s `.measurement` mode. Android: `AudioSource.UNPROCESSED` (ne všude podporováno – detekovat a varovat).
- Vzorkování 48 kHz, PCM 16/32-bit, mono. Bluetooth sluchátka/mikrofony zakázat (komprese, latence).
- Držení telefonu ovlivňuje měření (ruka, tělo stíní). Doporučit držet telefon před sebou na natažené ruce, mikrofon směrem k bednám.

## Architektura

```
Flutter UI (Dart)
  ├── audio_capture   — platform channel → nativní raw PCM stream (Swift / Kotlin)
  ├── signal_gen      — generování růžového šumu / log-sweep (WAV), přehrání buď z telefonu
  │                     (kalibrace) nebo export pro přehrání z počítače/DAC do beden
  ├── dsp             — FFT, RTA, 1/3-oktávová pásma, impulzní odezva (Dart, případně Go přes FFI
  │                     pokud Dart nestíhá — začít v Dartu, `fftea` package)
  ├── ar_tracking     — platform channel → ARKit (ARWorldTrackingConfiguration) / ARCore pozice
  │                     telefonu 60 Hz, souřadnice relativně k bodu "start"
  ├── session_store   — měření = seznam bodů {x,y,z, timestamp, spektrum[N], SPL_rel}, SQLite/JSON
  └── viz             — 2D půdorys s heatmapou po frekvenčních pásmech + 3D pohled (flutter_3d / vlastní canvas)
```

Backend není potřeba. Vše lokálně v telefonu.

## Fáze

### Fáze 1 — SPL metr + RTA (MVP, 1–2 týdny)
- Nativní capture raw PCM s vypnutým zpracováním (iOS measurement mode).
- Real-time spektrální analyzátor: FFT 8192, Hann okno, 1/3-oktávová pásma 20 Hz – 20 kHz, průměrování.
- Relativní SPL v dB (dBFS + volitelný offset "kalibrace" ručně zadaný).
- Generátor růžového šumu přehrávaný z telefonu (pro rychlý test) + export WAV růžového šumu a log-sweepu (20 Hz–20 kHz, 10 s) pro přehrání z počítače do beden.
- **Cíl fáze:** telefon ukazuje spektrum a uživatel vidí, že se mění podle místa v pokoji.

### Fáze 2 — AR tagované body měření (2 týdny)
- ARKit world tracking, uživatel položí "origin" (např. místo posluchače) klepnutím.
- Tlačítko "změřit tady": 3 s průměrování spektra + uložení pozice. Nebo kontinuální mód – měření každých 0,5 m pohybu.
- Uložení session, seznam bodů.
- 2D půrodys: body vykresleny v půdorysu, barva = hladina ve zvoleném pásmu (slider 31 Hz – 16 kHz). Interpolace mezi body (IDW) → heatmapa.
- **Cíl fáze:** vidět módy místnosti — např. pás 63 Hz ukáže maxima u stěn a minimum uprostřed.

### Fáze 3 — Impulzní odezva a čas (2–3 týdny)
- Log-sweep přehraný z beden, záznam telefonem, dekonvoluce → impulzní odezva (IR) v každém bodě.
- Synchronizace bez kabelu: cross-korelace záznamu se sweepem → time offset. Absolutní čas není potřeba, jen relativní.
- Z IR: frekvenční odezva s okénkem (gating – oddělení přímého zvuku od odrazů), RT60 odhad, první odrazy.
- Porovnání L vs R bedna (přehrát sweep zvlášť do každého kanálu).
- **Cíl fáze:** v bodě posluchače ukázat přímou odezvu vs. odezvu s místností.

### Fáze 4 — Výstupy a integrace (1 týden)
- Export FRD (frekvence, dB, fáze) per bod → import do REW / VituixCAD (navazuje na projekt reprobeden).
- 3D pohled na mrak bodů s heatmapou, výřez podle výšky.
- Doporučení: "nejrovnější místo pro posluchače" = bod s nejmenší variancí v 40–300 Hz.
- Sdílení session jako JSON.

## Klíčová technická rozhodnutí

- **Flutter + nativní platform channels** pro audio a AR — žádný Flutter plugin nedává raw PCM s vypnutým AGC a zároveň AR pozici spolehlivě; napsat vlastní tenké Swift/Kotlin vrstvy.
- **DSP v Dartu** na začátek (`fftea`), měřit výkon; pokud RTA 60 fps nestíhá, přesunout FFT do Go přes `dart:ffi`.
- **iOS first** — ARKit tracking je výrazně stabilnější a `.measurement` mode je zaručený. Android až po validaci.
- **Nikdy nesledovat orientaci telefonu jako směr zvuku** — jen pozici. Orientaci pouze pro varování "držíš telefon špatně".

## Ověření, že to funguje (akceptační testy)

1. Sinus 100 Hz z bedny, chůze od bedny ke zdi: SPL se musí měnit s periodickými maximy/minimy (stojaté vlnění, půlvlna ≈ 1,7 m).
2. Stejný bod změřený 3× po sobě: rozptyl < 1 dB v pásmech nad 100 Hz.
3. Bod změřený, odchod a návrat přes AR: pozice se shodne < 10 cm.
4. Export FRD se otevře v REW a odezva se řádově shoduje s REW měřením UMIK mikrofonem (do ±5 dB, 60 Hz – 10 kHz).

## Open source / reference

- REW (Room EQ Wizard) — referenční metodika (sweep, IR, gating, RT60). Není open source, ale dokumentace je veřejná a popisuje algoritmy.
- `fftea` (Dart FFT), `ar_flutter_plugin` (jen inspirace – pozici brát nativně).
- Farina, "Simultaneous measurement of impulse response and distortion with a swept-sine technique" — základ dekonvoluce.
- iOS `AVAudioSession.Mode.measurement`, Android `MediaRecorder.AudioSource.UNPROCESSED`.

## Otevřené otázky pro kamaráda

1. Chce měřit **místnost** (kam bedny/posluchač), nebo **bedny samotné**? Pro bedny samotné je lepší koupit UMIK-1 (~2 500 Kč) a REW – telefon nestačí.
2. Má možnost přehrát testovací signál z počítače do beden (DAC/zesilovač)? Bez toho jde jen růžový šum z telefonu, což je k ničemu.
3. iPhone nebo Android? (Rozhoduje o fázi 1.)
4. Stačí mu 2D půdorys heatmapy, nebo opravdu chce 3D (výška málokdy přidá informaci — módy jsou hlavně v půdorysu).
