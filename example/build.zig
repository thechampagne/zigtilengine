const std = @import("std");

const Pkgs = struct {
    const zigtilengine = std.build.Pkg{
        .name = "zigtilengine",
        .path = . { .path = "../src/zigtilengine.zig" },
    };
};

pub fn build(b: *std.build.Builder) void {
    
    const target = b.standardTargetOptions(.{});
    
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("example", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.addPackage(Pkgs.zigtilengine);
    exe.linkLibC();
    exe.linkSystemLibraryName("Tilengine");
    exe.install();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
