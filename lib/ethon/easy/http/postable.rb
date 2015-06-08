module Ethon
  class Easy
    module Http

      # This module contains logic for setting up a [multipart] POST body.
      module Postable

        # Set things up when form is provided.
        # Deals with multipart forms.
        #
        # @example Setup.
        #   post.set_form(easy)
        #
        # @param [ Easy ] easy The easy to setup.
        def set_form(easy)
          easy.url ||= url
          form.rack_arrays = true if array_encoding == :rack
          if form.multipart?
            form.escape = false
            form.materialize
            easy.httppost = form.first.read_pointer
          else
            form.escape = true
            easy.postfieldsize = form.to_s.bytesize
            easy.copypostfields = form.to_s
          end
        end
      end
    end
  end
end
