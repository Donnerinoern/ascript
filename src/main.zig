const std = @import("std");
const io = std.io;
const os = std.os;

pub fn main() !void {
    // var args = os.argv;
    const stdout_file = io.getStdOut().writer();
    var bw = io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try runPrompt(&stdout, &bw);
}

fn runPrompt(stdout: anytype, bw: anytype) !void {
    const run = true;
    const stdin = io.getStdIn().reader();
    while (run) {
        try stdout.print("> ", .{});
        try bw.flush();
        var buffer: [128]u8 = undefined;
        if (try stdin.readUntilDelimiterOrEof(&buffer, '\n')) |input| {
            std.debug.print("{s}\n", .{input});
        }
    }
}

// test "simple test" {
//     var list = std.ArrayList(i32).init(std.testing.allocator);
//     defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
//     try list.append(42);
//     try std.testing.expectEqual(@as(i32, 42), list.pop());
// }
