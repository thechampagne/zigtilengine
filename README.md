# zigtilengine

[![](https://img.shields.io/github/v/tag/thechampagne/zigtilengine?label=version)](https://github.com/thechampagne/zigtilengine/releases/latest) [![](https://img.shields.io/github/license/thechampagne/zigtilengine)](https://github.com/thechampagne/zigtilengine/blob/main/LICENSE)

Zig binding for **Tilengine** a 2D graphics engine with raster effects for retro/classic style game development.

### Example
```zig
const tile = @import("zigtilengine");

pub fn main() void {
    var foreground: tile.TLN_Tilemap = undefined;

    _ = tile.TLN_Init(400, 240, 1, 0, 0);
    foreground = tile.TLN_LoadTilemap("assets/sonic/Sonic_md_fg1.tmx", null);
    _ = tile.TLN_SetLayerTilemap(0, foreground);

    _ = tile.TLN_CreateWindow(null, 0);
    while (tile.TLN_ProcessWindow()) {
        tile.TLN_DrawFrame(0);
    }

    _ = tile.TLN_DeleteTilemap(foreground);
    tile.TLN_Deinit();
}
```

### References
 - [Tilengine](https://github.com/megamarc/Tilengine)

### License

This repo is released under the [MPL-2.0](https://github.com/thechampagne/zigtilengine/blob/main/LICENSE).
