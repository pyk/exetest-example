const std = @import("std");
const exetest = @import("exetest");
const testing = std.testing;

test "echo" {
    const argv = &[_][]const u8{ "echo", "hello" };
    var result = try exetest.run(.{ .argv = argv });
    defer result.deinit();

    try testing.expectEqualStrings("hello\n", result.stdout);
}
