module SmartUi
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
        if @args.shift == "english"
          ButtleEnglish.new.start
        else
          Buttle.new.start
        end
      end
    end
  end
end
