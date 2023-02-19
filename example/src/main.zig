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
