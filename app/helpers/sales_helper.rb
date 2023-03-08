module SalesHelper

    def has_sales?
        current_creator.sales.any?
    end

    def merch_price(sale)
        Merchandise.find_by(id: sale.merchandise_id).price
    end

    def merch_title(sale)
        Merchandise.find_by(id: sale.merchandise_id).title
    end

    def merch_title(sale)
        Merchandise.find_by(id: sale.merchandise_id).title
    end

    def merch_creator_name(sale)
        Merchandise.find_by(id: sale.merchandise_id).creator.username
    end

    def merch_total(sale)
        m = Merchandise.find_by(id: sale.merchandise_id)
        m.price + (sale.tip ||= 0)
    end
end
