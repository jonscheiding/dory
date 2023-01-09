module Dory
  module Alias
    module Macos
      def self.configure(address)
        Bash.run_command("sudo /sbin/ifconfig lo0 alias #{Shellwords.escape(address)} >/dev/null")
      end

      def self.clean(address)
        Bash.run_command("sudo /sbin/ifconfig lo0 delete #{Shellwords.escape(address)} >/dev/null")
      end

      def self.check(address)
        result = Bash.run_command("/sbin/ifconfig lo0")
        result.stdout.include? "inet #{address}"
      end
    end
  end
end
