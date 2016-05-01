module AddressValidate
  module API
    class Error
      attr_reader :error

      def initialize(error)
        @error = error
      end

      def message
        error.Description.text
      end

      def code
        error.Number.text
      end

      def source
        error.Source.text
      end
    end
  end
end
