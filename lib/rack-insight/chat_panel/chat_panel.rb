module Rack::Insight
  class ChatPanel < Panel
    class MethodCalled
      attr_reader :method_call, :time, :args, :message, :backtrace

      include Rack::Insight::FilteredBacktrace

      def initialize(time, args, message, backtrace)
        @time = time
        @args= args
        @message = message
        @backtrace = backtrace
      end

      def display_time
        "%.2fms" % time
      end

    end

    def after_detect(method_call, timing, args, message)
      logger.debug("detected: phat_method")# if verbose(:high)
      backtrace = method_call.backtrace[2..-1]
      store(@env, MethodCalled.new(timing.duration, args, message, backtrace))
    end

    def initialize(app)
      table_setup("chat")

      super

      probe(self) do
        instrument "Chat" do
          instance_probe :phat_method
        end
      end

    end

    def name
      "SUPER CHAT"
    end

    def heading
      "SUPER CHAT"
    end

    def content_for_request(number)
      render_template "views/chat_panel", :chats => retrieve(number)
    end
  end

end
