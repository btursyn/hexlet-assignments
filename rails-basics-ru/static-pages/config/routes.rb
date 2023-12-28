# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'
  resources :pages, only: :show
  # END
end
