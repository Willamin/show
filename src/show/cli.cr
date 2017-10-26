module Show
  class Cli
    def initialize
    end

    def run
      if ARGV.size == 0
        puts <<-USAGE
show THING

ls the thing if it's a directory
cat the thing if it's a file
USAGE
        exit
      end

      path = ARGV[-1]

      flags = ARGV[0..-2].join(" ")

      command = flags + " " + path

      if File.directory? path
        command = "ls" + command
      end

      if File.file? path
        command = "cat" + command
      end

      system(command)
    end
  end
end
