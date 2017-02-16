module ItemsHelper
  def time_left(item)
    if item.expired?
      "0 days left"
    else
      "#{distance_of_time_in_words(7.days.ago, item.created_at)} left"
    end
  end  
end
