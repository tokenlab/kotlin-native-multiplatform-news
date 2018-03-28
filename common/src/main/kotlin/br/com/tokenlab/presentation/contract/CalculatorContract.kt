package br.com.tokenlab.presentation.contract

import br.com.tokenlab.domain.usecase.SumUseCaseRequest
import br.com.tokenlab.presentation.common.PresenterProtocol
import br.com.tokenlab.presentation.common.ViewProtocol

interface CalculatorPresenterProtocol : PresenterProtocol {
    fun takeView(view: CalculatorViewProtocol)
    fun dropView()
    fun sum(request: SumUseCaseRequest)
}

interface CalculatorViewProtocol : ViewProtocol {

    fun showResult(result: Float)
}