const std = @import("std");
const exetest = @import("exetest");
const testing = std.testing;

test "via exe name" {
    const argv = &[_][]const u8{"exetest-example"};
    var result = try exetest.run(.{ .argv = argv });
    defer result.deinit();

    try testing.expectEqualStrings("project-exe\n", result.stderr);
}

test "via path" {
    const argv = &[_][]const u8{"./zig-out/bin/exetest-example"};
    var result = try exetest.run(.{ .argv = argv });
    defer result.deinit();

    try testing.expectEqualStrings("project-exe\n", result.stderr);
}
