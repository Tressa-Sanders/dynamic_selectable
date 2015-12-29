module DynamicSelectable
  module ActionView
    module Helpers
      module DynamicFormOptionsHelper
        def dynamic_collection_select(object, method, dynamic_model, collection, value_method, text_method,
                                      options = {}, html_options = {})
          select_url    = "dynamic_selectable_#{method.to_s.sub(/_id$/, '')}_#{dynamic_model.to_s.pluralize}_path"
          parent_id     = ":#{method}"
          select_target = "##{object}_#{dynamic_model}_id"

          data_options = { data: { dynamic_selectable_url: send(select_url, parent_id),
                                   dynamic_selectable_target: select_target } }

          if options[:submit_with_form] == true
            submit_object = object
            submit_method = method
          end

          collection_select(submit_object, submit_method, collection, value_method, text_method,
                            options, html_options.merge(data_options))
        end
      end
    end
  end
end
