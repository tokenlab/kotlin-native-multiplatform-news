package br.com.tokenlab.domain.usecase

import br.com.tokenlab.domain.usecase.common.UseCase
import br.com.tokenlab.domain.usecase.common.UseCaseRequest
import br.com.tokenlab.domain.usecase.common.UseCaseResponse

class SumUseCaseRequest(val x: Float, val y: Float) : UseCaseRequest

class SumUseCaseResponse(val result: Float) : UseCaseResponse

class SumUseCase() : UseCase<SumUseCaseRequest, SumUseCaseResponse>() {

    override fun executeUseCase(request: SumUseCaseRequest) {
        val result = request.x + request.y
        val response = SumUseCaseResponse(result)
        success(response)
    }
}