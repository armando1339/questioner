module Api
  module V1  
    class AnswersController < ApplicationController
      before_action :set_question, only: %i(create)

      def index; end

      def create
        @answer = @question.answers.build(answers_params)

        if @answer.save
          render :show
        else
          render(
            json: { errors: @answer.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      def update; end
      def show; end

      private

      def set_question
        @question = Question.find(params[:question_id])
      end

      def answers_params
        params.require(:answer).permit(:body)
      end
    end
  end
end
