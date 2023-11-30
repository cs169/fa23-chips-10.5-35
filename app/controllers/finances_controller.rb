# frozen_string_literal: true

class FinancesController < ApplicationController
  CATEGORIES = { 'Candidate Loan' => 'candidate-loan', 'Contribution Total' => 'contribution-total',
    'Debts Owed' => 'debts-owed', 'Disbursements Total' => 'disbursements-total',
    'End Cash' => 'end-cash', 'Individual Total' => 'individual-total', 'PAC Total' => 'pac-total',
    'Receipts Total' => 'receipts-total', 'Refund Total' => 'refund-total' }.freeze

  def index
    @categories = CATEGORIES
  end

  def search
    reverse_categories = { 'candidate-loan' => 'Candidate Loan', 'contribution-total' => 'Contribution Total',
      'debts-owed' => 'Debts Owed', 'disbursements-total' => 'Disbursements Total', 'end-cash' => 'End Cash',
      'individual-total' => 'Individual Total', 'pac-total' => 'PAC Total', 'receipts-total' => 'Receipts Total',
      'refund-total' => 'Refund Total' }
    response = JSON.parse(Finance.campaign_finances_to_representative_params(params))
    @cycle = params[:cycle]
    @category = reverse_categories[params[:category].to_s]
    @results = get_canidate_category(response['results'], CATEGORIES[@category.to_s])
  end

  private

  def get_canidate_category(result, category)
    data_keys = { 'candidate-loan' => 'candidate_loans', 'contribution-total' => 'total_contributions',
      'debts-owed' => 'debts_owed', 'disbursements-total' => 'total_disbursements', 'end-cash' => 'end_cash',
      'individual-total' => 'total_from_individuals', 'pac-total' => 'total_from_pacs',
      'receipts-total' => 'total_receipts', 'refund-total' => 'total_refunds' }

    actual_category = data_keys[category.to_s]

    candidates = result.map do |candidate|
      { name: candidate['name'], amount: candidate[actual_category.to_s] || 0 }
    end

    candidates.sort_by { |candidate| -candidate[:amount] }
  end
end
