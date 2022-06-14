module AddressValidate
  module API
    class Request
      attr_reader :data

      def self.build_xml(data)
        new(data).build_xml
      end

      def initialize(data)
        @data = data
      end

      def build_xml
        request_xml = build_node('AddressValidateRequest', nil,
                        { 'USERID' => AddressValidate.username })
        request_xml << build_revision
        request_xml << build_address
        Ox.dump(request_xml)
      end

      def build_node(name, text, attrs={})
        node = Ox::Element.new(name)
        attrs.each { |key, value| node[key] = value }
        node << text if text
        node
      end

      def build_revision
        build_node('Revision', '1', {})
      end

      def build_address
        address = build_node('Address', nil, { 'ID' => 0 })
        AddressValidate.address_fields_map.each do |field, name|
          address << build_node(field, data[name])
        end
        address
      end
    end
  end
end
