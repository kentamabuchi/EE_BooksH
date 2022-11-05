# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )



Rails.application.config.assets.precompile += %w( header_menu.js )
Rails.application.config.assets.precompile += %w( review_comment.js )
Rails.application.config.assets.precompile += %w( signUpForm.js )
Rails.application.config.assets.precompile += %w( signInForm.js )
Rails.application.config.assets.precompile += %w( about.js )
Rails.application.config.assets.precompile += %w( slide.js )
Rails.application.config.assets.precompile += %w( menuBar.js )
Rails.application.config.assets.precompile += %w( createBook.js )
Rails.application.config.assets.precompile += %w( books_violation.js )
Rails.application.config.assets.precompile += %w( jquery.raty.js )
Rails.application.config.assets.precompile += %w( confirmation.js )
Rails.application.config.assets.precompile += %w( change_icon.js )

