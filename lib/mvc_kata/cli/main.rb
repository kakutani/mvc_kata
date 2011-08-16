require 'r18n-core'
module MvcKata
  module Cli
    class Main
      class << self
        def execute(args)
          new(args).execute!
        end
      end

      def initialize(args, out_stream = STDOUT, error_stream = STDERR)
        @args         = args
        @out_stream   = out_stream

        @error_stream = error_stream
      end

      def execute!(existing_runtime = nil)
        locale = "ja"
        if "english" == @args.shift
          locale = "en"
        end
        Battle.start!(locale)
      end
    end
  end
end
