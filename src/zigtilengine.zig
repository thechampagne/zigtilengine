pub const TILENGINE_VER_MAJ = @as(c_int, 2);
pub const TILENGINE_VER_MIN = @as(c_int, 14);
pub const TILENGINE_VER_REV = @as(c_int, 0);
pub const TILENGINE_HEADER_VERSION = ((TILENGINE_VER_MAJ << @as(c_int, 16)) | (TILENGINE_VER_MIN << @as(c_int, 8))) | TILENGINE_VER_REV;

pub const TLN_OVERLAY_NONE = @as(c_int, 0);
pub const TLN_OVERLAY_SHADOWMASK = @as(c_int, 0);
pub const TLN_OVERLAY_APERTURE = @as(c_int, 0);
pub const TLN_OVERLAY_SCANLINES = @as(c_int, 0);
pub const TLN_OVERLAY_CUSTOM = @as(c_int, 0);

pub const TLN_TileFlags = enum(c_uint) {
    NONE = 0,
    FLIPX = (1 << 15),
    FLIPY = (1 << 14),
    ROTATE = (1 << 13),
    PRIORITY = (1 << 12),
    MASKED = (1 << 11),
    TILESET = (7 << 8),
    PALETTE = (7 << 5),
};

pub const TLN_Blend = enum(c_uint) {
    NONE,
    MIX25,
    MIX50,
    MIX75,
    ADD,
    SUB,
    MOD,
    CUSTOM,
    MAX_BLEND,
    MIX = TLN_Blend.MIX50
};

pub const TLN_LayerType = enum(c_uint) {
    NONE,
    TILE,
    OBJECT,
    BITMAP
};
pub const TLN_Affine = extern struct {
    angle: f32,
    dx: f32,
    dy: f32,
    sx: f32,
    sy: f32,
};
const anon_struct_1 = opaque {};
const anon_union = extern union {
    flags: u16,
    anon: anon_struct_1,
};
const anon_struct_0 = extern struct {
    index: u16,
    anon: anon_union,
};
pub const Tile = extern union {
    value: u32,
    anon: anon_struct_0,
};
pub const TLN_SequenceFrame = extern struct {
    index: c_int,
    delay: c_int,
};
pub const TLN_ColorStrip = extern struct {
    delay: c_int,
    first: u8,
    count: u8,
    dir: u8,
};
pub const TLN_SequenceInfo = extern struct {
    name: [32]u8,
    num_frames: c_int,
};
pub const TLN_SpriteData = extern struct {
    name: [64]u8,
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};
pub const TLN_SpriteInfo = extern struct {
    w: c_int,
    h: c_int,
};
pub const TLN_TileInfo = extern struct {
    index: u16,
    flags: u16,
    row: c_int,
    col: c_int,
    xoffset: c_int,
    yoffset: c_int,
    color: u8,
    type: u8,
    empty: bool,
};
pub const TLN_ObjectInfo = extern struct {
    id: u16,
    gid: u16,
    flags: u16,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    type: u8,
    visible: bool,
    name: [64]u8,
};
pub const TLN_TileAttributes = extern struct {
    type: u8,
    priority: bool,
};

pub const TLN_CRT = enum(c_uint) {
    TLN_CRT_SLOT,
    TLN_CRT_APERTURE,
    TLN_CRT_SHADOW
};
pub const TLN_PixelMap = extern struct {
    dx: i16,
    dy: i16,
};
pub const Engine = opaque {};
pub const TLN_Engine = ?*Engine;
pub const TLN_Tile = [*c]Tile;
pub const Tileset = opaque {};
pub const TLN_Tileset = ?*Tileset;
pub const Tilemap = opaque {};
pub const TLN_Tilemap = ?*Tilemap;
pub const Palette = opaque {};
pub const TLN_Palette = ?*Palette;
pub const Spriteset = opaque {};
pub const TLN_Spriteset = ?*Spriteset;
pub const Sequence = opaque {};
pub const TLN_Sequence = ?*Sequence;
pub const SequencePack = opaque {};
pub const TLN_SequencePack = ?*SequencePack;
pub const Bitmap = opaque {};
pub const TLN_Bitmap = ?*Bitmap;
pub const ObjectList = opaque {};
pub const TLN_ObjectList = ?*ObjectList;
pub const TLN_TileImage = extern struct {
    bitmap: TLN_Bitmap,
    id: u16,
    type: u8,
};
pub const TLN_SpriteState = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
    flags: u32,
    palette: TLN_Palette,
    spriteset: TLN_Spriteset,
    index: c_int,
    enabled: bool,
    collision: bool,
};
pub const SDL_Event = opaque {};
pub const TLN_VideoCallback = ?fn (c_int) callconv(.C) void;
pub const TLN_BlendFunction = ?fn (u8, u8) callconv(.C) u8;
pub const TLN_SDLCallback = ?fn (?*SDL_Event) callconv(.C) void;

pub const TLN_Player = enum(c_uint) {
    PLAYER1,
    PLAYER2,
    PLAYER3,
    PLAYER4
};

pub const TLN_Input = enum(c_uint) {
    NONE,
    UP,
    DOWN,
    LEFT,
    RIGHT,
    BUTTON1,
    BUTTON2,
    BUTTON3,
    BUTTON4,
    BUTTON5,
    BUTTON6,
    START,
    QUIT,
    CRT,

    P1 = (TLN_Player.PLAYER1 << 5),
    P2 = (TLN_Player.PLAYER2 << 5),
    P3 = (TLN_Player.PLAYER3 << 5),
    P4 = (TLN_Player.PLAYER4 << 5),

    A = TLN_Input.BUTTON1,
    B = TLN_Input.BUTTON2,
    C = TLN_Input.BUTTON3,
    D = TLN_Input.BUTTON4,
    E = TLN_Input.BUTTON5,
    F = TLN_Input.BUTTON6
};

pub const CWF_FULLSCREEN: c_int = 1;
pub const CWF_VSYNC: c_int = 2;
pub const CWF_S1: c_int = 4;
pub const CWF_S2: c_int = 8;
pub const CWF_S3: c_int = 12;
pub const CWF_S4: c_int = 16;
pub const CWF_S5: c_int = 20;
pub const CWF_NEAREST: c_int = 64;

pub const TLN_Error = enum(c_uint) {
    OK,
    OUT_OF_MEMORY,
    IDX_LAYER,
    IDX_SPRITE,
    IDX_ANIMATION,
    IDX_PICTURE,
    REF_TILESET,
    REF_TILEMAP,
    REF_SPRITESET,
    REF_PALETTE,
    REF_SEQUENCE,
    REF_SEQPACK,
    REF_BITMAP,
    NULL_POINTER,
    FILE_NOT_FOUND,
    WRONG_FORMAT,
    WRONG_SIZE,
    UNSUPPORTED,
    REF_LIST,
    IDX_PALETTE,
    MAX_ERR
};

pub const TLN_LogLevel = enum(c_uint) {
    NONE,
    ERRORS,
    VERBOSE
};

pub extern "C" fn TLN_Init(hres: c_int, vres: c_int, numlayers: c_int, numsprites: c_int, numanimations: c_int) TLN_Engine;
pub extern "C" fn TLN_Deinit() void;
pub extern "C" fn TLN_DeleteContext(context: TLN_Engine) bool;
pub extern "C" fn TLN_SetContext(context: TLN_Engine) bool;
pub extern "C" fn TLN_GetContext() TLN_Engine;
pub extern "C" fn TLN_GetWidth() c_int;
pub extern "C" fn TLN_GetHeight() c_int;
pub extern "C" fn TLN_GetNumObjects() u32;
pub extern "C" fn TLN_GetUsedMemory() u32;
pub extern "C" fn TLN_GetVersion() u32;
pub extern "C" fn TLN_GetNumLayers() c_int;
pub extern "C" fn TLN_GetNumSprites() c_int;
pub extern "C" fn TLN_SetBGColor(r: u8, g: u8, b: u8) void;
pub extern "C" fn TLN_SetBGColorFromTilemap(tilemap: TLN_Tilemap) bool;
pub extern "C" fn TLN_DisableBGColor() void;
pub extern "C" fn TLN_SetBGBitmap(bitmap: TLN_Bitmap) bool;
pub extern "C" fn TLN_SetBGPalette(palette: TLN_Palette) bool;
pub extern "C" fn TLN_SetGlobalPalette(index: c_int, palette: TLN_Palette) bool;
pub extern "C" fn TLN_SetRasterCallback(TLN_VideoCallback) void;
pub extern "C" fn TLN_SetFrameCallback(TLN_VideoCallback) void;
pub extern "C" fn TLN_SetRenderTarget(data: [*c]u8, pitch: c_int) void;
pub extern "C" fn TLN_UpdateFrame(frame: c_int) void;
pub extern "C" fn TLN_SetLoadPath(path: [*c]const u8) void;
pub extern "C" fn TLN_SetCustomBlendFunction(TLN_BlendFunction) void;
pub extern "C" fn TLN_SetLogLevel(log_level: TLN_LogLevel) void;
pub extern "C" fn TLN_OpenResourcePack(filename: [*c]const u8, key: [*c]const u8) bool;
pub extern "C" fn TLN_CloseResourcePack() void;
pub extern "C" fn TLN_GetGlobalPalette(index: c_int) TLN_Palette;
pub extern "C" fn TLN_SetLastError(@"error": TLN_Error) void;
pub extern "C" fn TLN_GetLastError() TLN_Error;
pub extern "C" fn TLN_GetErrorString(@"error": TLN_Error) [*c]const u8;
pub extern "C" fn TLN_CreateWindow(overlay: [*c]const u8, flags: c_int) bool;
pub extern "C" fn TLN_CreateWindowThread(overlay: [*c]const u8, flags: c_int) bool;
pub extern "C" fn TLN_SetWindowTitle(title: [*c]const u8) void;
pub extern "C" fn TLN_ProcessWindow() bool;
pub extern "C" fn TLN_IsWindowActive() bool;
pub extern "C" fn TLN_GetInput(id: TLN_Input) bool;
pub extern "C" fn TLN_EnableInput(player: TLN_Player, enable: bool) void;
pub extern "C" fn TLN_AssignInputJoystick(player: TLN_Player, index: c_int) void;
pub extern "C" fn TLN_DefineInputKey(player: TLN_Player, input: TLN_Input, keycode: u32) void;
pub extern "C" fn TLN_DefineInputButton(player: TLN_Player, input: TLN_Input, joybutton: u8) void;
pub extern "C" fn TLN_DrawFrame(frame: c_int) void;
pub extern "C" fn TLN_WaitRedraw() void;
pub extern "C" fn TLN_DeleteWindow() void;
pub extern "C" fn TLN_EnableBlur(mode: bool) void;
pub extern "C" fn TLN_ConfigCRTEffect(@"type": TLN_CRT, blur: bool) void;
pub extern "C" fn TLN_EnableCRTEffect(overlay: c_int, overlay_factor: u8, threshold: u8, v0: u8, v1: u8, v2: u8, v3: u8, blur: bool, glow_factor: u8) void;
pub extern "C" fn TLN_DisableCRTEffect() void;
pub extern "C" fn TLN_SetSDLCallback(TLN_SDLCallback) void;
pub extern "C" fn TLN_Delay(msecs: u32) void;
pub extern "C" fn TLN_GetTicks() u32;
pub extern "C" fn TLN_GetWindowWidth() c_int;
pub extern "C" fn TLN_GetWindowHeight() c_int;
pub extern "C" fn TLN_CreateSpriteset(bitmap: TLN_Bitmap, data: [*c]TLN_SpriteData, num_entries: c_int) TLN_Spriteset;
pub extern "C" fn TLN_LoadSpriteset(name: [*c]const u8) TLN_Spriteset;
pub extern "C" fn TLN_CloneSpriteset(src: TLN_Spriteset) TLN_Spriteset;
pub extern "C" fn TLN_GetSpriteInfo(spriteset: TLN_Spriteset, entry: c_int, info: [*c]TLN_SpriteInfo) bool;
pub extern "C" fn TLN_GetSpritesetPalette(spriteset: TLN_Spriteset) TLN_Palette;
pub extern "C" fn TLN_FindSpritesetSprite(spriteset: TLN_Spriteset, name: [*c]const u8) c_int;
pub extern "C" fn TLN_SetSpritesetData(spriteset: TLN_Spriteset, entry: c_int, data: [*c]TLN_SpriteData, pixels: ?*anyopaque, pitch: c_int) bool;
pub extern "C" fn TLN_DeleteSpriteset(Spriteset: TLN_Spriteset) bool;
pub extern "C" fn TLN_CreateTileset(numtiles: c_int, width: c_int, height: c_int, palette: TLN_Palette, sp: TLN_SequencePack, attributes: [*c]TLN_TileAttributes) TLN_Tileset;
pub extern "C" fn TLN_CreateImageTileset(numtiles: c_int, images: [*c]TLN_TileImage) TLN_Tileset;
pub extern "C" fn TLN_LoadTileset(filename: [*c]const u8) TLN_Tileset;
pub extern "C" fn TLN_CloneTileset(src: TLN_Tileset) TLN_Tileset;
pub extern "C" fn TLN_SetTilesetPixels(tileset: TLN_Tileset, entry: c_int, srcdata: [*c]u8, srcpitch: c_int) bool;
pub extern "C" fn TLN_GetTileWidth(tileset: TLN_Tileset) c_int;
pub extern "C" fn TLN_GetTileHeight(tileset: TLN_Tileset) c_int;
pub extern "C" fn TLN_GetTilesetNumTiles(tileset: TLN_Tileset) c_int;
pub extern "C" fn TLN_GetTilesetPalette(tileset: TLN_Tileset) TLN_Palette;
pub extern "C" fn TLN_GetTilesetSequencePack(tileset: TLN_Tileset) TLN_SequencePack;
pub extern "C" fn TLN_DeleteTileset(tileset: TLN_Tileset) bool;
pub extern "C" fn TLN_CreateTilemap(rows: c_int, cols: c_int, tiles: TLN_Tile, bgcolor: u32, tileset: TLN_Tileset) TLN_Tilemap;
pub extern "C" fn TLN_LoadTilemap(filename: [*c]const u8, layername: [*c]const u8) TLN_Tilemap;
pub extern "C" fn TLN_CloneTilemap(src: TLN_Tilemap) TLN_Tilemap;
pub extern "C" fn TLN_GetTilemapRows(tilemap: TLN_Tilemap) c_int;
pub extern "C" fn TLN_GetTilemapCols(tilemap: TLN_Tilemap) c_int;
pub extern "C" fn TLN_SetTilemapTileset(tilemap: TLN_Tilemap, tileset: TLN_Tileset) bool;
pub extern "C" fn TLN_GetTilemapTileset(tilemap: TLN_Tilemap) TLN_Tileset;
pub extern "C" fn TLN_SetTilemapTileset2(tilemap: TLN_Tilemap, tileset: TLN_Tileset, index: c_int) bool;
pub extern "C" fn TLN_GetTilemapTileset2(tilemap: TLN_Tilemap, index: c_int) TLN_Tileset;
pub extern "C" fn TLN_GetTilemapTile(tilemap: TLN_Tilemap, row: c_int, col: c_int, tile: TLN_Tile) bool;
pub extern "C" fn TLN_SetTilemapTile(tilemap: TLN_Tilemap, row: c_int, col: c_int, tile: TLN_Tile) bool;
pub extern "C" fn TLN_CopyTiles(src: TLN_Tilemap, srcrow: c_int, srccol: c_int, rows: c_int, cols: c_int, dst: TLN_Tilemap, dstrow: c_int, dstcol: c_int) bool;
pub extern "C" fn TLN_GetTilemapTiles(tilemap: TLN_Tilemap, row: c_int, col: c_int) TLN_Tile;
pub extern "C" fn TLN_DeleteTilemap(tilemap: TLN_Tilemap) bool;
pub extern "C" fn TLN_CreatePalette(entries: c_int) TLN_Palette;
pub extern "C" fn TLN_LoadPalette(filename: [*c]const u8) TLN_Palette;
pub extern "C" fn TLN_ClonePalette(src: TLN_Palette) TLN_Palette;
pub extern "C" fn TLN_SetPaletteColor(palette: TLN_Palette, color: c_int, r: u8, g: u8, b: u8) bool;
pub extern "C" fn TLN_MixPalettes(src1: TLN_Palette, src2: TLN_Palette, dst: TLN_Palette, factor: u8) bool;
pub extern "C" fn TLN_AddPaletteColor(palette: TLN_Palette, r: u8, g: u8, b: u8, start: u8, num: u8) bool;
pub extern "C" fn TLN_SubPaletteColor(palette: TLN_Palette, r: u8, g: u8, b: u8, start: u8, num: u8) bool;
pub extern "C" fn TLN_ModPaletteColor(palette: TLN_Palette, r: u8, g: u8, b: u8, start: u8, num: u8) bool;
pub extern "C" fn TLN_GetPaletteData(palette: TLN_Palette, index: c_int) [*c]u8;
pub extern "C" fn TLN_DeletePalette(palette: TLN_Palette) bool;
pub extern "C" fn TLN_CreateBitmap(width: c_int, height: c_int, bpp: c_int) TLN_Bitmap;
pub extern "C" fn TLN_LoadBitmap(filename: [*c]const u8) TLN_Bitmap;
pub extern "C" fn TLN_CloneBitmap(src: TLN_Bitmap) TLN_Bitmap;
pub extern "C" fn TLN_GetBitmapPtr(bitmap: TLN_Bitmap, x: c_int, y: c_int) [*c]u8;
pub extern "C" fn TLN_GetBitmapWidth(bitmap: TLN_Bitmap) c_int;
pub extern "C" fn TLN_GetBitmapHeight(bitmap: TLN_Bitmap) c_int;
pub extern "C" fn TLN_GetBitmapDepth(bitmap: TLN_Bitmap) c_int;
pub extern "C" fn TLN_GetBitmapPitch(bitmap: TLN_Bitmap) c_int;
pub extern "C" fn TLN_GetBitmapPalette(bitmap: TLN_Bitmap) TLN_Palette;
pub extern "C" fn TLN_SetBitmapPalette(bitmap: TLN_Bitmap, palette: TLN_Palette) bool;
pub extern "C" fn TLN_DeleteBitmap(bitmap: TLN_Bitmap) bool;
pub extern "C" fn TLN_CreateObjectList() TLN_ObjectList;
pub extern "C" fn TLN_AddTileObjectToList(list: TLN_ObjectList, id: u16, gid: u16, flags: u16, x: c_int, y: c_int) bool;
pub extern "C" fn TLN_LoadObjectList(filename: [*c]const u8, layername: [*c]const u8) TLN_ObjectList;
pub extern "C" fn TLN_CloneObjectList(src: TLN_ObjectList) TLN_ObjectList;
pub extern "C" fn TLN_GetListNumObjects(list: TLN_ObjectList) c_int;
pub extern "C" fn TLN_GetListObject(list: TLN_ObjectList, info: [*c]TLN_ObjectInfo) bool;
pub extern "C" fn TLN_DeleteObjectList(list: TLN_ObjectList) bool;
pub extern "C" fn TLN_SetLayer(nlayer: c_int, tileset: TLN_Tileset, tilemap: TLN_Tilemap) bool;
pub extern "C" fn TLN_SetLayerTilemap(nlayer: c_int, tilemap: TLN_Tilemap) bool;
pub extern "C" fn TLN_SetLayerBitmap(nlayer: c_int, bitmap: TLN_Bitmap) bool;
pub extern "C" fn TLN_SetLayerPalette(nlayer: c_int, palette: TLN_Palette) bool;
pub extern "C" fn TLN_SetLayerPosition(nlayer: c_int, hstart: c_int, vstart: c_int) bool;
pub extern "C" fn TLN_SetLayerScaling(nlayer: c_int, xfactor: f32, yfactor: f32) bool;
pub extern "C" fn TLN_SetLayerAffineTransform(nlayer: c_int, affine: [*c]TLN_Affine) bool;
pub extern "C" fn TLN_SetLayerTransform(layer: c_int, angle: f32, dx: f32, dy: f32, sx: f32, sy: f32) bool;
pub extern "C" fn TLN_SetLayerPixelMapping(nlayer: c_int, table: [*c]TLN_PixelMap) bool;
pub extern "C" fn TLN_SetLayerBlendMode(nlayer: c_int, mode: TLN_Blend, factor: u8) bool;
pub extern "C" fn TLN_SetLayerColumnOffset(nlayer: c_int, offset: [*c]c_int) bool;
pub extern "C" fn TLN_SetLayerClip(nlayer: c_int, x1: c_int, y1: c_int, x2: c_int, y2: c_int) bool;
pub extern "C" fn TLN_DisableLayerClip(nlayer: c_int) bool;
pub extern "C" fn TLN_SetLayerWindow(nlayer: c_int, x1: c_int, y1: c_int, x2: c_int, y2: c_int, invert: bool) bool;
pub extern "C" fn TLN_SetLayerWindowColor(nlayer: c_int, r: u8, g: u8, b: u8, blend: TLN_Blend) bool;
pub extern "C" fn TLN_DisableLayerWindow(nlayer: c_int) bool;
pub extern "C" fn TLN_DisableLayerWindowColor(nlayer: c_int) bool;
pub extern "C" fn TLN_SetLayerMosaic(nlayer: c_int, width: c_int, height: c_int) bool;
pub extern "C" fn TLN_DisableLayerMosaic(nlayer: c_int) bool;
pub extern "C" fn TLN_ResetLayerMode(nlayer: c_int) bool;
pub extern "C" fn TLN_SetLayerObjects(nlayer: c_int, objects: TLN_ObjectList, tileset: TLN_Tileset) bool;
pub extern "C" fn TLN_SetLayerPriority(nlayer: c_int, enable: bool) bool;
pub extern "C" fn TLN_SetLayerParent(nlayer: c_int, parent: c_int) bool;
pub extern "C" fn TLN_DisableLayerParent(nlayer: c_int) bool;
pub extern "C" fn TLN_DisableLayer(nlayer: c_int) bool;
pub extern "C" fn TLN_EnableLayer(nlayer: c_int) bool;
pub extern "C" fn TLN_GetLayerType(nlayer: c_int) TLN_LayerType;
pub extern "C" fn TLN_GetLayerPalette(nlayer: c_int) TLN_Palette;
pub extern "C" fn TLN_GetLayerTileset(nlayer: c_int) TLN_Tileset;
pub extern "C" fn TLN_GetLayerTilemap(nlayer: c_int) TLN_Tilemap;
pub extern "C" fn TLN_GetLayerBitmap(nlayer: c_int) TLN_Bitmap;
pub extern "C" fn TLN_GetLayerObjects(nlayer: c_int) TLN_ObjectList;
pub extern "C" fn TLN_GetLayerTile(nlayer: c_int, x: c_int, y: c_int, info: [*c]TLN_TileInfo) bool;
pub extern "C" fn TLN_GetLayerWidth(nlayer: c_int) c_int;
pub extern "C" fn TLN_GetLayerHeight(nlayer: c_int) c_int;
pub extern "C" fn TLN_GetLayerX(nlayer: c_int) c_int;
pub extern "C" fn TLN_GetLayerY(nlayer: c_int) c_int;
pub extern "C" fn TLN_ConfigSprite(nsprite: c_int, spriteset: TLN_Spriteset, flags: u32) bool;
pub extern "C" fn TLN_SetSpriteSet(nsprite: c_int, spriteset: TLN_Spriteset) bool;
pub extern "C" fn TLN_SetSpriteFlags(nsprite: c_int, flags: u32) bool;
pub extern "C" fn TLN_EnableSpriteFlag(nsprite: c_int, flag: u32, enable: bool) bool;
pub extern "C" fn TLN_SetSpritePivot(nsprite: c_int, px: f32, py: f32) bool;
pub extern "C" fn TLN_SetSpritePosition(nsprite: c_int, x: c_int, y: c_int) bool;
pub extern "C" fn TLN_SetSpritePicture(nsprite: c_int, entry: c_int) bool;
pub extern "C" fn TLN_SetSpritePalette(nsprite: c_int, palette: TLN_Palette) bool;
pub extern "C" fn TLN_SetSpriteBlendMode(nsprite: c_int, mode: TLN_Blend, factor: u8) bool;
pub extern "C" fn TLN_SetSpriteScaling(nsprite: c_int, sx: f32, sy: f32) bool;
pub extern "C" fn TLN_ResetSpriteScaling(nsprite: c_int) bool;
pub extern "C" fn TLN_GetSpritePicture(nsprite: c_int) c_int;
pub extern "C" fn TLN_GetSpriteX(nsprite: c_int) c_int;
pub extern "C" fn TLN_GetSpriteY(nsprite: c_int) c_int;
pub extern "C" fn TLN_GetAvailableSprite() c_int;
pub extern "C" fn TLN_EnableSpriteCollision(nsprite: c_int, enable: bool) bool;
pub extern "C" fn TLN_GetSpriteCollision(nsprite: c_int) bool;
pub extern "C" fn TLN_GetSpriteState(nsprite: c_int, state: [*c]TLN_SpriteState) bool;
pub extern "C" fn TLN_SetFirstSprite(nsprite: c_int) bool;
pub extern "C" fn TLN_SetNextSprite(nsprite: c_int, next: c_int) bool;
pub extern "C" fn TLN_EnableSpriteMasking(nsprite: c_int, enable: bool) bool;
pub extern "C" fn TLN_SetSpritesMaskRegion(top_line: c_int, bottom_line: c_int) void;
pub extern "C" fn TLN_SetSpriteAnimation(nsprite: c_int, sequence: TLN_Sequence, loop: c_int) bool;
pub extern "C" fn TLN_DisableSpriteAnimation(nsprite: c_int) bool;
pub extern "C" fn TLN_PauseSpriteAnimation(index: c_int) bool;
pub extern "C" fn TLN_ResumeSpriteAnimation(index: c_int) bool;
pub extern "C" fn TLN_DisableAnimation(index: c_int) bool;
pub extern "C" fn TLN_DisableSprite(nsprite: c_int) bool;
pub extern "C" fn TLN_GetSpritePalette(nsprite: c_int) TLN_Palette;
pub extern "C" fn TLN_CreateSequence(name: [*c]const u8, target: c_int, num_frames: c_int, frames: [*c]TLN_SequenceFrame) TLN_Sequence;
pub extern "C" fn TLN_CreateCycle(name: [*c]const u8, num_strips: c_int, strips: [*c]TLN_ColorStrip) TLN_Sequence;
pub extern "C" fn TLN_CreateSpriteSequence(name: [*c]const u8, spriteset: TLN_Spriteset, basename: [*c]const u8, delay: c_int) TLN_Sequence;
pub extern "C" fn TLN_CloneSequence(src: TLN_Sequence) TLN_Sequence;
pub extern "C" fn TLN_GetSequenceInfo(sequence: TLN_Sequence, info: [*c]TLN_SequenceInfo) bool;
pub extern "C" fn TLN_DeleteSequence(sequence: TLN_Sequence) bool;
pub extern "C" fn TLN_CreateSequencePack() TLN_SequencePack;
pub extern "C" fn TLN_LoadSequencePack(filename: [*c]const u8) TLN_SequencePack;
pub extern "C" fn TLN_GetSequence(sp: TLN_SequencePack, index: c_int) TLN_Sequence;
pub extern "C" fn TLN_FindSequence(sp: TLN_SequencePack, name: [*c]const u8) TLN_Sequence;
pub extern "C" fn TLN_GetSequencePackCount(sp: TLN_SequencePack) c_int;
pub extern "C" fn TLN_AddSequenceToPack(sp: TLN_SequencePack, sequence: TLN_Sequence) bool;
pub extern "C" fn TLN_DeleteSequencePack(sp: TLN_SequencePack) bool;
pub extern "C" fn TLN_SetPaletteAnimation(index: c_int, palette: TLN_Palette, sequence: TLN_Sequence, blend: bool) bool;
pub extern "C" fn TLN_SetPaletteAnimationSource(index: c_int, TLN_Palette) bool;
pub extern "C" fn TLN_GetAnimationState(index: c_int) bool;
pub extern "C" fn TLN_SetAnimationDelay(index: c_int, frame: c_int, delay: c_int) bool;
pub extern "C" fn TLN_GetAvailableAnimation() c_int;
pub extern "C" fn TLN_DisablePaletteAnimation(index: c_int) bool;
pub extern "C" fn TLN_LoadWorld(tmxfile: [*c]const u8, first_layer: c_int) bool;
pub extern "C" fn TLN_SetWorldPosition(x: c_int, y: c_int) void;
pub extern "C" fn TLN_SetLayerParallaxFactor(nlayer: c_int, x: f32, y: f32) bool;
pub extern "C" fn TLN_SetSpriteWorldPosition(nsprite: c_int, x: c_int, y: c_int) bool;
pub extern "C" fn TLN_ReleaseWorld() void;
