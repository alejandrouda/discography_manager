Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :artists do
    resources :lps, only: [:index, :show]
  end

  resources :lps do
    resources :songs, only: [:index, :show]
  end

  resources :songs, only: [:index, :show]
  resources :authors, only: [:index, :show]

  get 'report/lps', to: 'reports#lp_report', as: 'report_lps'
end
