# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'
  # BEGIN
  resources :posts do
    resources :post_comments, module: :posts
  end
  resources :posts do
    resources :post_comments, only: [:new, :create]
  end

  resources :posts, shallow: true do
    resources :post_comments, only: [:show, :edit, :update, :destroy]
  end
  # END
end
