Rails.application.routes.draw do
  get 'report', to: 'report#report'
  devise_for :users
  root 'artists#index'

  resources :artists do
    resources :lps
  end

  resources :lps do
    resources :songs
  end

  resources :songs, only: [:index, :show]
  resources :authors, only: [:index, :show]

  get 'report/lps', to: 'reports#lp_report', as: 'report_lps'
end
