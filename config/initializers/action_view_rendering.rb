# frozen_string_literal: true
config = Rails.application.config
config.action_view.field_error_proc = proc { |html_tag, _| html_tag }
ActionView::Base.default_form_builder = Web::FormBuilder
