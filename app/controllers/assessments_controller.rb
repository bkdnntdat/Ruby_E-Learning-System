class AssessmentsController < ApplicationController
    def written
        prepare_meta_tags title: “Written English Assessment Test”
        set_meta_tags noindex: true
        @assessment_questions = AssessmentQuestion.all
        @assessment_options = AssessmentOption.all
        @empty_answers = []
        
        AssessmentQuestion.all.each do
            @empty_answers << AssessmentAnswer.new
        end
        render :layout => ‘english’
    end
end
