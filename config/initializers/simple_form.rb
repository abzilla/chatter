SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a
  # complete input. You can remove any component from the
  # wrapper, change the order or even add your own to the
  # stack. The options given below are used to wrap the
  # whole input.
  config.wrappers :default, :class => :input do |b|
    # config goes here
  end

  config.wrappers :special, :class => input do |b|
    # special config goes here
  end

  config.default_wrapper = :default
end