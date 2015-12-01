Sale::Engine.routes.draw do
  scope ':uuid' do
    
  end
  get ':uuid' => 'sales#index', as: :root
end
