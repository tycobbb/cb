Rails.application.routes.draw do
  scope module: 'web' do
    root(to: 'game#show')
  end
end
