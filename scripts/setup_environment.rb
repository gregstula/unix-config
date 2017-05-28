#!/bin/sh
exec ruby -x "$0" "$@"
#!ruby -W0

# setup-environment
# The MIT License (MIT) [https://opensource.org/licenses/MIT]
# Copyright (c) 2016 Gregory D. Stula
#
#  Created by Gregory D. Stula on 1/4/16.
#

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

# Actual example
# puts 'Importing categories [ ' + green('DONE') + ' ]'
# puts 'Importing tags       [' + red('FAILED') + ']'

# ghetto option parsing
backup_enabled = (ARGV[1] == "--back-up") || (ARGV[1] == "-b")

topleveldir= `git rev-parse --show-toplevel`.chomp
if topleveldir.empty?
   $stdout.puts red('No .git/ found!')
   exit(1)
end

unix_config_dir = "#{ENV['HOME']}/.unix_config_dir"

`echo #{topleveldir} > #{unix_config_dir}`

homedir = ENV["HOME"] + "/"
filenames = [".zshrc", ".zsh", ".vimrc", ".vim"].map { |name| homedir + name }

spacing = filenames.max_by(&:length).length + 1

filenames.each do |file|
    if File.exists?(file) && !File.symlink?(file)
        now = Time.now.to_s.split(" ").join("-")
        backup = "#{file}.old-#{now}"
        action = ''

        backup_enabled ? action = "mv #{file} #{backup}" : action = "rm #{file}"

        `#{action}`

        $stdout.puts green("Previous #{file} was saved as #{backup}") if action == "mv"
    end

   `rm #{file}` if File.symlink?(file)

   source = "#{ file.split( "." )[1] }"
   file =~ /(vim|zsh|git)/i
   `ln -s #{topleveldir}/#{$1}.config/#{source} #{file}`

    puts green("#{file}|").rjust(spacing)
end

success_message = green("| were successfully symlinked.")
puts success_message.rjust(success_message.length + spacing - 1)

puts

puts "Would you like to install Microsoft Fonts now? (Y/n)"
answer = STDIN.gets.chomp

if answer.downcase == 'y'
	system('./MicrosoftFontInstaller')
elsif answer.downcase == 'n'
    puts "You can always install later by running MicrosoftFontInstaller in \$UNIX_CONFIG_DIR/unix-config/scripts"
else
    puts "Aborting ..."
end

puts

puts "Fetching and building dependencies..."
sleep(1)
`mkdir ~/bin`
system('./build-dependencies.zsh')

puts
puts

puts green("System ready for UNIX-ing!")
