module CryptoCalcRes

import StructTypes

struct Asset
    name::String
    code::String
    type::String
    contract_address::Union{Nothing, String}
    uuid::String
    symbol::Nothing
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

struct In
    asset_quantity::AssetQuantity
    type::Nothing
    integration::Integration
end

struct Asset257
    name::String
    symbol::Union{Nothing, String}
    code::String
    type::String
    contract_address::Union{Nothing, String}
    uuid::String
end

struct AssetQuantity258
    asset::Asset257
    quantity::Float64
end

struct Integration259
    name::String
    type::String
    uuid::String
    user_integration_uuid::String
end

struct Out
    asset_quantity::AssetQuantity258
    type::Nothing
    integration::Integration259
end

struct Asset260
    name::String
    symbol::String
    code::String
    type::String
    uuid::String
end

struct var"E2a4afac-92c6-11e9-a5ee-0a290192900c"
    asset::Asset260
    quantity::Float64
end

struct var"E2a4af02-92c6-11e9-a5ee-0a290192900c"
    var"e2a4afac-92c6-11e9-a5ee-0a290192900c"::var"E2a4afac-92c6-11e9-a5ee-0a290192900c"
end

struct Asset261
    name::String
    symbol::String
    code::String
    type::String
    uuid::String
end

struct var"E2a4afac-92c6-11e9-a5ee-0a290192900c262"
    asset::Asset261
    quantity::Float64
end

struct var"93eaade8-e605-11e9-a5ee-0a290192900c"
    var"e2a4afac-92c6-11e9-a5ee-0a290192900c"::var"E2a4afac-92c6-11e9-a5ee-0a290192900c262"
end

struct Asset263
    name::String
    symbol::String
    code::String
    type::String
    uuid::String
end

struct var"E2a4afac-92c6-11e9-a5ee-0a290192900c264"
    asset::Asset263
    quantity::Float64
end

struct var"E2a4abec-92c6-11e9-a5ee-0a290192900c"
    var"e2a4afac-92c6-11e9-a5ee-0a290192900c"::var"E2a4afac-92c6-11e9-a5ee-0a290192900c264"
end

struct Asset265
    name::String
    symbol::String
    code::String
    type::String
    uuid::String
end

struct var"E2a4afac-92c6-11e9-a5ee-0a290192900c266"
    asset::Asset265
    quantity::Float64
end

struct var"57f13bab-0646-4d1c-89ed-406525a6c481"
    var"e2a4afac-92c6-11e9-a5ee-0a290192900c"::var"E2a4afac-92c6-11e9-a5ee-0a290192900c266"
end

struct Rate
    var"e2a4af02-92c6-11e9-a5ee-0a290192900c"::var"E2a4af02-92c6-11e9-a5ee-0a290192900c"
    var"93eaade8-e605-11e9-a5ee-0a290192900c"::Union{Nothing, var"93eaade8-e605-11e9-a5ee-0a290192900c"}
    var"e2a4abec-92c6-11e9-a5ee-0a290192900c"::Union{Nothing, var"E2a4abec-92c6-11e9-a5ee-0a290192900c"}
    var"57f13bab-0646-4d1c-89ed-406525a6c481"::Union{Nothing, var"57f13bab-0646-4d1c-89ed-406525a6c481"}
end

struct Asset267
    name::String
    code::String
    type::String
    uuid::String
end

struct AssetQuantity268
    asset::Asset267
    quantity::Float64
end

struct Integration269
    name::String
    type::String
    uuid::String
    user_integration_uuid::String
end

struct Fee
    asset_quantity::AssetQuantity268
    type::Nothing
    integration::Integration269
end

struct Transaction
    id::String
    user_id::String
    datetime::String
    type::String
    ins::Union{Nothing, In}
    outs::Union{Nothing, Out}
    rates::Rate
    fees::Union{Nothing, Fee}
end

struct RealizedCostBase
    cost_basis_date::String
    sale_date::String
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

struct var"E2a4af02-92c6-11e9-a5ee-0a290192900c270"
    unit_cost::Union{Nothing, Int64}
    qty::Float64
    acquired_date::String
    asset_id::String
    transaction_id::String
    acquisition_integration_id::Union{Nothing, String}
    acquisition_transaction_type::Union{Nothing, String}
    var"missing_cost_basis?"::Union{Nothing, Bool}
    var"transferred?"::Union{Nothing, Bool}
    integration_id::Union{Nothing, String}
    var"current_day?"::Union{Nothing, Bool}
    disposed_date::Nothing
    disposal_integration_id::Nothing
    sub_items::Nothing
end

struct var"93eaade8-e605-11e9-a5ee-0a290192900c271"
    unit_cost::Int64
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

struct var"Fba771dc-501d-5f4d-a7ec-bf4e1c689598"
    unit_cost::Int64
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

struct var"E2a4abec-92c6-11e9-a5ee-0a290192900c272"
    unit_cost::Int64
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

struct var"E27d4dd5-6cf3-4c68-b9a0-b602b6f20b49"
    unit_cost::Int64
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

struct var"57f13bab-0646-4d1c-89ed-406525a6c481273"
    unit_cost::Int64
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

struct var"C1915b8d-b5e8-5120-b763-3f9a3b1a5841"
    unit_cost::Int64
    qty::Int64
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

struct var"253adbd7-a7ee-4126-8d91-6c6e9f3bcf18"
    var"e2a4af02-92c6-11e9-a5ee-0a290192900c"::Array{var"E2a4af02-92c6-11e9-a5ee-0a290192900c270", 1}
    var"93eaade8-e605-11e9-a5ee-0a290192900c"::Union{Nothing, var"93eaade8-e605-11e9-a5ee-0a290192900c271"}
    var"fba771dc-501d-5f4d-a7ec-bf4e1c689598"::Union{Nothing, var"Fba771dc-501d-5f4d-a7ec-bf4e1c689598"}
    var"e2a4abec-92c6-11e9-a5ee-0a290192900c"::Union{Nothing, var"E2a4abec-92c6-11e9-a5ee-0a290192900c272"}
    var"e27d4dd5-6cf3-4c68-b9a0-b602b6f20b49"::Union{Nothing, var"E27d4dd5-6cf3-4c68-b9a0-b602b6f20b49"}
    var"57f13bab-0646-4d1c-89ed-406525a6c481"::Union{Nothing, var"57f13bab-0646-4d1c-89ed-406525a6c481273"}
    var"c1915b8d-b5e8-5120-b763-3f9a3b1a5841"::Union{Nothing, var"C1915b8d-b5e8-5120-b763-3f9a3b1a5841"}
end

struct var"E2a4af02-92c6-11e9-a5ee-0a290192900c274"
    unit_cost::Int64
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

struct var"93eaade8-e605-11e9-a5ee-0a290192900c275"
    unit_cost::Int64
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
    var"e2a4af02-92c6-11e9-a5ee-0a290192900c"::Array{var"E2a4af02-92c6-11e9-a5ee-0a290192900c274", 1}
    var"93eaade8-e605-11e9-a5ee-0a290192900c"::Array{var"93eaade8-e605-11e9-a5ee-0a290192900c275", 1}
end

struct IntegrationAssetQueue
    var"253adbd7-a7ee-4126-8d91-6c6e9f3bcf18"::var"253adbd7-a7ee-4126-8d91-6c6e9f3bcf18"
    var"virtual-repository"::Union{Nothing, var"Virtual-repository"}
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
StructTypes.StructType(::Type{Asset257}) = StructTypes.Struct()
StructTypes.StructType(::Type{AssetQuantity258}) = StructTypes.Struct()
StructTypes.StructType(::Type{Integration259}) = StructTypes.Struct()
StructTypes.StructType(::Type{Out}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset260}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4afac - 92c6) - 1.1e10) - a5ee) - 0a290192900c}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4af02 - 92c6) - 1.1e10) - a5ee) - 0a290192900c}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset261}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4afac - 92c6) - 1.1e10) - a5ee) - 0a290192900c262}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((93 * eaade8 - e605) - 1.1e10) - a5ee) - 0a290192900c}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset263}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4afac - 92c6) - 1.1e10) - a5ee) - 0a290192900c264}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4abec - 92c6) - 1.1e10) - a5ee) - 0a290192900c}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset265}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4afac - 92c6) - 1.1e10) - a5ee) - 0a290192900c266}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((5.7f14bab - 646) - 4d1c) - 89 * ed) - 406525a6c481}) = StructTypes.Struct()
StructTypes.StructType(::Type{Rate}) = StructTypes.Struct()
StructTypes.StructType(::Type{Asset267}) = StructTypes.Struct()
StructTypes.StructType(::Type{AssetQuantity268}) = StructTypes.Struct()
StructTypes.StructType(::Type{Integration269}) = StructTypes.Struct()
StructTypes.StructType(::Type{Fee}) = StructTypes.Struct()
StructTypes.StructType(::Type{Transaction}) = StructTypes.Struct()
StructTypes.StructType(::Type{RealizedCostBase}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4af02 - 92c6) - 1.1e10) - a5ee) - 0a290192900c270}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((93 * eaade8 - e605) - 1.1e10) - a5ee) - 0a290192900c271}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((Fba771dc - 501d) - 50000.0f0d) - a7ec) - bf4e1c689598}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4abec - 92c6) - 1.1e10) - a5ee) - 0a290192900c272}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E27d4dd5 - 6cf3) - 4c68) - b9a0) - b602b6f20b49}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((5.7f14bab - 646) - 4d1c) - 89 * ed) - 406525a6c481273}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((C1915b8d - b5e8) - 5120) - b763) - 3.0f9a3b1a5841}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((253adbd7 - a7ee) - 4126) - 8d91) - 6c6e9f3bcf18}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((E2a4af02 - 92c6) - 1.1e10) - a5ee) - 0a290192900c274}) = StructTypes.Struct()
StructTypes.StructType(::Type{(((93 * eaade8 - e605) - 1.1e10) - a5ee) - 0a290192900c275}) = StructTypes.Struct()
StructTypes.StructType(::Type{Virtual - repository}) = StructTypes.Struct()
StructTypes.StructType(::Type{IntegrationAssetQueue}) = StructTypes.Struct()
StructTypes.StructType(::Type{CostBasisManager}) = StructTypes.Struct()
StructTypes.StructType(::Type{CryptoCalcRe}) = StructTypes.Struct()

end # module
