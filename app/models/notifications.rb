class Notifications < ActionMailer::Base
  def new_offer(help_offer)
    subject    'Your Job Request has a new offer of help'
    recipients help_offer.job_request.user.email
    from       DO_NOT_REPLY
    sent_on    Time.now
    body       :help_offer => help_offer
  end
  
  def accepted_offer(help_offer)
    subject    'Your Help Offer has been accepted'
    recipients help_offer.user.email
    from       DO_NOT_REPLY
    sent_on    Time.now
    body       :help_offer => help_offer
  end
  
  def feedback(feedback)
    subject    'Job Completion Feedback'
    recipients feedback.help_offer.user.email
    from       DO_NOT_REPLY
    sent_on    Time.now
    body       :feedback => feedback
  end
end
