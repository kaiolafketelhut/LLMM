var v86_config = {
  bios: { url: "./v86/bios/seabios.bin" },
  vga_bios: { url: "./v86/bios/vgabios.bin" },
  hda: { url: "./v86/images/200.img" },
  autostart: true,
  memory_size: 128 * 1024 * 1024,
  acpi: true,
};
document.addEventListener("DOMContentLoaded", () => {
  window.emulator = new V86Starter(v86_config);
  setTimeout(()=>{ try{emulator.focus()}catch(e){} }, 1200);
});
