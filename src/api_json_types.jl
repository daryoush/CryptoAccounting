

import StructTypes
using TimeZones

struct Asset
    name::String
    code::Union{Nothing, String}
    type::String
    contract_address::Union{Nothing, String}
    uuid::String
    symbol::Union{Nothing, String}
end

struct AssetQuantity
    asset::Asset
    quantity::Float64
end

struct Integration
    name::String
    type::String
    uuid::String
    user_integration_uuid::String
end


struct AssetQtyIntegration
    asset_quantity::AssetQuantity
    type::Nothing
    integration::Integration
end


struct Transaction
    id::String
    user_id::String
    datetime::TimeZones.ZonedDateTime
    type::String
    ins::Union{Nothing, Array{AssetQtyIntegration}}
    outs::Union{Nothing, Array{AssetQtyIntegration}}
    rates::Union{Nothing, Dict{String, Dict{String, AssetQuantity }}}
    fees::Union{Nothing, Array{AssetQtyIntegration}}
end

struct RealizedCostBase
    cost_basis_date::TimeZones.ZonedDateTime
    sale_date::TimeZones.ZonedDateTime
    asset_sold::String
    amount_sold::Float64
    gain_type::String
    tax_year::String
    gain::Int64
    proceeds::Int64
    cost::Int64
    acquisition_integration_id::String
    disposition_integration_id::String
    var"fulfilled_on_integration?"::Bool
    transaction_type::String
    acquisition_transaction_id::String
    disposition_transaction_id::String
    var"missing_cost_basis?"::Nothing
    var"disallowed_loss?"::Bool
    var"transferred?"::Union{Nothing, Bool}
    var"masked?"::Bool
end

struct CB
    unit_cost::Union{Nothing, Int64}
    qty::Float64
    acquired_date::Union{Nothing, TimeZones.ZonedDateTime}
    asset_id::String
    transaction_id::String
    acquisition_integration_id::Union{Nothing, String}
    acquisition_transaction_type::Union{Nothing, String}
    var"missing_cost_basis?"::Union{Nothing, Bool}
    var"transferred?"::Union{Nothing, Bool}
    integration_id::Union{Nothing, String}
    var"current_day?"::Union{Nothing, Bool}
    disposed_date::Union{Nothing, TimeZones.ZonedDateTime}
    disposal_integration_id::Union{Nothing, String}
    sub_items::Union{Nothing, String}
end


struct CostBasisManager
    integration_asset_queues::Union{Nothing, Dict{String, Dict{String, Array{CB} }}}
    fiat_asset_id::String
end

struct CryptoCalcResult
    transaction::Transaction
    realized_cost_bases::Union{Nothing, Array{RealizedCostBase}}
    cost_basis_manager::Union{Nothing, CostBasisManager}
end


struct CryptoCalcResults
    results::Array{CryptoCalcResult}
end


StructTypes.StructType(::Type{CryptoCalcResults}) = StructTypes.CustomStruct()
StructTypes.lower(x::CryptoCalcResults) = x.results
StructTypes.lowertype(::Type{CryptoCalcResults}) = Array{CryptoCalcResult}
StructTypes.construct(::Type{Array{CryptoCalcResults}}, x::Array{CryptoCalcResult}) = CryptoCalcResults(x)


StructTypes.StructType(::Type{Asset}) = StructTypes.Struct()
StructTypes.StructType(::Type{AssetQuantity}) = StructTypes.Struct()
StructTypes.StructType(::Type{Integration}) = StructTypes.Struct()
StructTypes.StructType(::Type{AssetQtyIntegration}) = StructTypes.Struct()
StructTypes.StructType(::Type{Transaction}) = StructTypes.Struct()
StructTypes.StructType(::Type{RealizedCostBase}) = StructTypes.Struct()
StructTypes.StructType(::Type{CB}) = StructTypes.Struct()
StructTypes.StructType(::Type{CostBasisManager}) = StructTypes.Struct()
StructTypes.StructType(::Type{CryptoCalcResult}) = StructTypes.Struct()


