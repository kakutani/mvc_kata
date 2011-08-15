require 'r18n-core'
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
        lang_param = @args.shift
        locale = "ja"
        if lang_param == "english"
          locale = "en"
        end
        i18n_path = File.expand_path('../../../../i18n/', __FILE__)
        R18n.set(locale, i18n_path)
        if locale == "en"
          ButtleEnglish.new.start
        else
          Buttle.new.start
        end
      end
    end
  end
end
