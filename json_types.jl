module CryptoCalcRes

import StructTypes

struct Asset
    name::String
    code::String
    type::String
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
end

struct In
    asset_quantity::AssetQuantity
    type::Nothing
    integration::Integration
end

struct Asset284
    name::String
    code::String
    type::String
    uuid::String
    symbol::Union{Nothing, String}
end

struct AssetQuantity285
    asset::Asset284
    quantity::Float64
end

struct Integration286
    name::String
    type::String
    uuid::String
end

struct Out
    asset_quantity::AssetQuantity285
    type::Nothing
    integration::Integration286
end

struct Asset287
    name::String
    symbol::String
    code::String
    type::String
    uuid::String
end

struct var"Df939ab7-b7ed-4216-be63-ca1d2a130396"
    asset::Asset287
    quantity::Float64
end

struct var"6636226c-f717-4c1f-9232-7f2d4c1add4f"
    var"df939ab7-b7ed-4216-be63-ca1d2a130396"::var"Df939ab7-b7ed-4216-be63-ca1d2a130396"
end

struct Asset288
    name::String
    symbol::String
    code::String
    type::String
    uuid::String
end

struct var"Df939ab7-b7ed-4216-be63-ca1d2a130396289"
    asset::Asset288
    quantity::Float64
end

struct var"9cd9f4d4-078b-4e44-a308-7662fec0f546"
    var"df939ab7-b7ed-4216-be63-ca1d2a130396"::var"Df939ab7-b7ed-4216-be63-ca1d2a130396289"
end

struct Rate
    var"6636226c-f717-4c1f-9232-7f2d4c1add4f"::Union{Nothing, var"6636226c-f717-4c1f-9232-7f2d4c1add4f"}
    var"9cd9f4d4-078b-4e44-a308-7662fec0f546"::Union{Nothing, var"9cd9f4d4-078b-4e44-a308-7662fec0f546"}
end

struct Transaction
    id::String
    user_id::String
    datetime::String
    type::String
    ins::Union{Nothing, In}
    outs::Union{Nothing, Out}
    rates::Rate
    fees::Nothing
end

struct RealizedCostBase
    cost_basis_date::String
    sale_date::String
    asset_sold::String
    amount_sold::Float64
    gain_type::String
    tax_year::String
    gain::Nothing
    proceeds::Float64
    cost::Nothing
    acquisition_integration_id::Nothing
    disposition_integration_id::String
    var"fulfilled_on_integration?"::Bool
    transaction_type::Nothing
    acquisition_transaction_id::String
    disposition_transaction_id::String
    var"missing_cost_basis?"::Bool
    var"disallowed_loss?"::Bool
    var"transferred?"::Nothing
    var"masked?"::Bool
end

struct var"6636226c-f717-4c1f-9232-7f2d4c1add4f290"
    unit_cost::Float64
    qty::Float64
    acquired_date::String
    asset_id::String
    transaction_id::String
    acquisition_integration_id::String
    acquisition_transaction_type::String
    var"missing_cost_basis?"::Nothing
    var"transferred?"::Bool
    integration_id::String
    var"current_day?"::Bool
    disposed_date::Nothing
    disposal_integration_id::Nothing
    sub_items::Nothing
end

struct var"Virtual-repository"
    var"9cd9f4d4-078b-4e44-a308-7662fec0f546"::Nothing
    var"6636226c-f717-4c1f-9232-7f2d4c1add4f"::Union{Nothing, var"6636226c-f717-4c1f-9232-7f2d4c1add4f290"}
end

struct var"9cd9f4d4-078b-4e44-a308-7662fec0f546291"
    unit_cost::Nothing
    qty::Float64
    acquired_date::String
    asset_id::String
    transaction_id::String
    acquisition_integration_id::Nothing
    acquisition_transaction_type::Nothing
    var"missing_cost_basis?"::Bool
    var"transferred?"::Nothing
    integration_id::Nothing
    var"current_day?"::Nothing
    disposed_date::Nothing
    disposal_integration_id::Nothing
    sub_items::Nothing
end

struct var"6636226c-f717-4c1f-9232-7f2d4c1add4f292"
    unit_cost::Float64
    qty::Float64
    acquired_date::String
    asset_id::String
    transaction_id::String
    acquisition_integration_id::String
    acquisition_transaction_type::String
    var"missing_cost_basis?"::Nothing
    var"transferred?"::Nothing
    integration_id::String
    var"current_day?"::Bool
    disposed_date::Nothing
    disposal_integration_id::Nothing
    sub_items::Nothing
end

struct var"2047b762-128a-4800-b19e-51ba84a9f72d"
    var"9cd9f4d4-078b-4e44-a308-7662fec0f546"::Array{var"9cd9f4d4-078b-4e44-a308-7662fec0f546291", 1}
    var"6636226c-f717-4c1f-9232-7f2d4c1add4f"::Union{Nothing, var"6636226c-f717-4c1f-9232-7f2d4c1add4f292"}
end

struct IntegrationAssetQueue
    var"virtual-repository"::var"Virtual-repository"
    var"2047b762-128a-4800-b19e-51ba84a9f72d"::var"2047b762-128a-4800-b19e-51ba84a9f72d"
end

struct CostBasisManager
    integration_asset_queues::IntegrationAssetQueue
    fiat_asset_id::String
end

struct CryptoCalcRe
    transaction::Transaction
    realized_cost_bases::Union{Nothing, RealizedCostBase}
    cost_basis_manager::CostBasisManager
end

StructTypes.StructType(::Type{Asset}) = StructTypes.Struct()
StructTypes.StructType(::Type{AssetQuantity}) = StructTypes.Struct()
StructTypes.StructType(::Type{Integration}) = StructTypes.Struct()
StructTypes.StructType(::Type{In}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset284}) = StructTypes.Struct()
StructTypes.StructType(::Type{AssetQuantity285}) = StructTypes.Struct()
StructTypes.StructType(::Type{Integration286}) = StructTypes.Struct()
StructTypes.StructType(::Type{Out}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset287}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((Df939ab7 - b7ed) - 4216) - be63) - ca1d2a130396}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((6636226c - f717) - 4c1f) - 9232) - 700.0f0d4c1add4f}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset288}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((Df939ab7 - b7ed) - 4216) - be63) - ca1d2a130396289}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((9cd9f4d4 - 78b) - 4.0e44) - a308) - 7662 * fec0f546}) = StructTypes.Struct()
StructTypes.StructType(::Type{Rate}) = StructTypes.Struct()
StructTypes.StructType(::Type{Transaction}) = StructTypes.Struct()
StructTypes.StructType(::Type{RealizedCostBase}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((6636226c - f717) - 4c1f) - 9232) - 700.0f0d4c1add4f290}) = StructTypes.Struct()
StructTypes.StructType(::Type{Virtual - repository}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((9cd9f4d4 - 78b) - 4.0e44) - a308) - 7662 * fec0f546291}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((6636226c - f717) - 4c1f) - 9232) - 700.0f0d4c1add4f292}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((2047b762 - 128a) - 4800) - b19e) - 51ba84a9f72d}) = StructTypes.Struct()
StructTypes.StructType(::Type{IntegrationAssetQueue}) = StructTypes.Struct()
StructTypes.StructType(::Type{CostBasisManager}) = StructTypes.Struct()
StructTypes.StructType(::Type{CryptoCalcRe}) = StructTypes.Struct()

end # module
