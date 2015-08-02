require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'POST #create' do
    let(:question) { create(:question) }
    let(:answer) { create(:answer, question: question) }

    context 'with valid attributes' do
      let(:valid_answer_params) do
        {
          question_id: question,
          answer: attributes_for(:answer)
        }
      end
      it 'saves the new answer in the database' do
        expect do
          post :create, valid_answer_params
        end.to change(Answer, :count).by(1)
      end

      it 'redirects to question' do
        post :create, valid_answer_params
        expect(response).to redirect_to question_path(question)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_answer_params) do
        {
          question_id: question,
          answer: attributes_for(:answer, body: '')
        }
      end
      it 'does not saves the new answer in the database' do
        expect do
          post :create, invalid_answer_params
        end.to_not change(question.answers, :count)
      end

      it 'new answer does not exist' do
        expect do
          post :create, invalid_answer_params
        end.to_not change(Answer, :count)
      end

      it 'redirects to show view' do
        post :create, invalid_answer_params
        expect(response).to render_template 'questions/show'
      end
    end
  end
end
