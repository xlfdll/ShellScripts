// Need Slider Control and Checkbox Control (from Expression Controls)
// Set Slider Control from 0 to text length (or a large number) to get text typed
// Keep Checkbox Control on

src = effect("Slider Control")("Slider");
on = effect("Checkbox Control")("Checkbox");
blink = Math.round(time % 1);
pipe = " ";

if (((blink == 1) || (src.speed > 0)) && (on == true)) {
  pipe = "▌"
}

substr(0, src) + pipe