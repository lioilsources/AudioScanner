import 'dart:typed_data';

/// Minimal RIFF/WAVE writer — enough to hand a test signal to a laptop, a DAC
/// or an amplifier.
///
/// The plan's workflow depends on this: the phone is the microphone, and the
/// signal is supposed to come out of the actual speakers being measured. A
/// sweep played from the phone's own speaker measures the phone.
class Wav {
  const Wav._();

  /// 16-bit PCM. Universally playable; the right default for handing someone a
  /// file to play.
  static Uint8List pcm16({
    required List<double> samples,
    int sampleRate = 48000,
    int channels = 1,
  }) {
    final data = ByteData(samples.length * 2);
    for (var i = 0; i < samples.length; i++) {
      final v = (samples[i].clamp(-1.0, 1.0) * 32767).round();
      data.setInt16(i * 2, v, Endian.little);
    }
    return _riff(
      data.buffer.asUint8List(),
      sampleRate: sampleRate,
      channels: channels,
      bitsPerSample: 16,
      floatFormat: false,
    );
  }

  /// 32-bit float. Keeps headroom and resolution for a sweep that will be
  /// deconvolved later; use when the playback chain accepts it.
  static Uint8List float32({
    required List<double> samples,
    int sampleRate = 48000,
    int channels = 1,
  }) {
    final data = ByteData(samples.length * 4);
    for (var i = 0; i < samples.length; i++) {
      data.setFloat32(i * 4, samples[i], Endian.little);
    }
    return _riff(
      data.buffer.asUint8List(),
      sampleRate: sampleRate,
      channels: channels,
      bitsPerSample: 32,
      floatFormat: true,
    );
  }

  /// Interleaves mono [samples] into one channel of a stereo file, silence in
  /// the other — how the plan measures L and R speakers separately.
  static List<double> toStereo(List<double> mono, {required bool left}) {
    final out = List<double>.filled(mono.length * 2, 0);
    for (var i = 0; i < mono.length; i++) {
      out[i * 2 + (left ? 0 : 1)] = mono[i];
    }
    return out;
  }

  static Uint8List _riff(
    Uint8List payload, {
    required int sampleRate,
    required int channels,
    required int bitsPerSample,
    required bool floatFormat,
  }) {
    final blockAlign = channels * bitsPerSample ~/ 8;
    final byteRate = sampleRate * blockAlign;
    final header = ByteData(44);
    var o = 0;
    void tag(String s) {
      for (final c in s.codeUnits) {
        header.setUint8(o++, c);
      }
    }

    void u32(int v) {
      header.setUint32(o, v, Endian.little);
      o += 4;
    }

    void u16(int v) {
      header.setUint16(o, v, Endian.little);
      o += 2;
    }

    tag('RIFF');
    u32(36 + payload.length);
    tag('WAVE');
    tag('fmt ');
    u32(16);
    u16(floatFormat ? 3 : 1); // 3 = IEEE float, 1 = PCM
    u16(channels);
    u32(sampleRate);
    u32(byteRate);
    u16(blockAlign);
    u16(bitsPerSample);
    tag('data');
    u32(payload.length);

    final out = Uint8List(44 + payload.length);
    out.setRange(0, 44, header.buffer.asUint8List());
    out.setRange(44, out.length, payload);
    return out;
  }
}
