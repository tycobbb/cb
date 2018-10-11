# frozen_string_literal: true
LoadPaths.new(Rails.application.config.root)
  .glob(LoadPaths::Directories::LIB, "ext", "**", "*.rb")
  .require
