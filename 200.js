// v86 config - auto-start bluh on page load
var v86_config = {
  bios: { url: "./v86/bios/seabios.bin" },
  vga_bios: { url: "./v86/bios/vgabios.bin" },
  hda: { url: "./v86/images/200.img" },
  autostart: true,
  cmdline: "console=ttyS0 root=/dev/sda rw",
  memory_size: 128 * 1024 * 1024,
  filesystem: { baseurl: "./v86/images/" }
};
if (typeof V86Starter !== "undefined") {
  var emulator = new V86Starter(v86_config);
}
