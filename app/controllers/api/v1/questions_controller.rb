module Api
  module V1  
    class QuestionsController < ApplicationController
      before_action :set_question, only: %w(update destroy)

      def index
        @questions = Question.all

        render :index
      end

      def create
        @question = Question.new(questions_params)

        if @question.save
          render :show
        else
          render(
            json: { errors: @question.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      def update
        if @question.update(questions_params)
          render :show
        else
          render(
            json: { errors: @question.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      def destroy
        @question.destroy
      end

      private

      def set_question
        @question = Question.find(params[:id])
      end

      def questions_params
        params
          .require(:question)
          .permit(:title, :body, tags_attributes: [:name])
      end
    end
  end
end
