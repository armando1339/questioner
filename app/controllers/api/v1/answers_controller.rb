module Api
  module V1  
    class AnswersController < ApplicationController
      before_action :set_question, only: %i(index create update destroy)
      before_action :set_answer, only: %i(update destroy)

      def index
        @pagy, @answers = pagy(@question.answers, items: 10)

        render :index
      end

      def create
        @answer = @question.answers.build(answers_params)
        @answer.user = current_user if logged_in?

        if @answer.save
          render :show
        else
          render(
            json: { errors: @answer.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      def update
        if @answer.update(answers_params)
          render :show
        else
          render(
            json: { errors: @answer.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      def destroy
        @answer.destroy
      end

      private

      def set_question
        @question = Question.find(params[:question_id])
      end

      def set_answer
        @answer = @question.answers.find(params[:id])
      end

      def answers_params
        params.require(:answer).permit(:body)
      end
    end
  end
end
