module UsersControllerModule
  def save_errything
    success = true

    User.transaction do
      unless @user.save
        raise ActiveRecord::Rollback, "Call tech support!"
      end

      post_params = params[:post]
      post_params.keys.each do |num|
        if post_params[num][:title] && post_params[num][:body]
          post = @user.posts.build(post_params[num])
          unless post.save
            p "it's a post"
            raise ActiveRecord::Rollback, "Call tech support!"
          end
        end
      end
    end

    unless success
      raise ActiveRecord::Rollback, "Call tech support!"
    end
  end
    
end