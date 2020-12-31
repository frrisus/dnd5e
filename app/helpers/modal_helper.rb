module ModalHelper
  def bootstrap_modal(id, klass, title, options = {})
    options[:submit_label] ||= 'OK'
    options[:inline] ||= false
    options[:form] ||= {}
    options[:form][:role] = 'form'
    options[:form][:id] = "#{id}-form"
    options[:form][:class] = (options[:inline] ? 'form-inline' : 'form')
    options[:form][:data] = { remote: true } if options[:remote]
    form_model = klass.is_a?(Class) ? klass.new : klass

    tag.div(id: "#{id}-modal", class: %w(modal fade), tabindex: '-1', role: 'dialog',
            aria: { hidden: true, labelledby: "#{id}-label" }) do
      tag.div(class: %w(modal-dialog)) do
        form_with(model: form_model, html: options[:form]) do |f|
          tag.div(class: %w(modal-content)) do
            view_join(
              tag.div(class: %w(modal-header)) do
                view_join(
                  tag.h5(title, id: "#{id}-label", class: 'modal-title'),
                  tag.button(type: 'button', class: %w(btn-close), 'data-dismiss': 'modal',
                    'aria-label': 'close') do
                    view_join(
                      bs_glyph('times', { 'aria-hidden': true }),
                      tag.span('close', class: %w(sr-only))
                    )
                  end
                )
              end,
              tag.div(class: %w(modal-body)) { yield(f) },
              tag.div(class: %w(modal-footer)) do
                view_join(
                  tag.button('Cancel', type: 'button', 'data-dismiss': 'modal',
                    class: %w(btn btn-outline-secondary)),
                  tag.button(options[:submit_label], type: 'submit', id: "#{id}-ok",
                    class: %w(btn btn-primary))
                )
              end
            )
          end
        end
      end
    end
  end
end
