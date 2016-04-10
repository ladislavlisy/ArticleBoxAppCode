//
// Created by Ladislav Lisy on 10.04.16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

public class ProcessConfigArticles
{
    public init ()
    {
    }

    private static let EMPTY_PENDING_NAMES: Array<ConfigArticleCode> = [];

    public static func ConfigureArticles() -> Array<Article>
    {
        let articlesArray = Array([
                ConfigureContractTermArticles(),

                ConfigurePositionTimeArticles(),

                ConfigureGrossIncomeArticles(),

                ConfigureTotalIncomeArticles(),

                ConfigureNettoDeductsArticles(),

                ConfigureBasisHealthArticles(),

                ConfigureBasisSocialArticles(),

                ConfigureBasisGarantArticles(),

                ConfigureBasisTaxingArticles(),

                ConfigureBasisAdvancesArticles(),

                ConfigureBasisWithholdArticles(),

                ConfigureAllowanceTaxisArticles(),
                ConfigureRebateTaxisArticles()
        ].flatten());

        return articlesArray;
    }

    private static func ConfigureContractTermArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_TERMS;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_CONTRACT_EMPL_TERM, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_POSITION_EMPL_TERM, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_CONTRACT_EMPL_TERM
                        )
                )
        ];
        return articleArray;
    }

    private static func ConfigurePositionTimeArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_TIMES;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_SCHEDULE_WORK, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_POSITION_EMPL_TERM
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TIMESHEET_SCHEDULE, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SCHEDULE_WORK
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TIMESHEET_WORKING, catg: configCategory,
                        pendings: PendingArticleNames2(
                        ConfigArticleCode.ARTICLE_TIMESHEET_SCHEDULE,
                                code2: ConfigArticleCode.ARTICLE_POSITION_EMPL_TERM
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TIMESHEET_ABSENCE, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TIMESHEET_WORKING
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TIMEHOURS_WORKING, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TIMESHEET_WORKING
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TIMEHOURS_ABSENCE, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TIMESHEET_ABSENCE
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureGrossIncomeArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_AMOUNT;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_SALARY_BASE, catg: configCategory,
                        pendings: PendingArticleNames2(
                        ConfigArticleCode.ARTICLE_TIMEHOURS_WORKING,
                                code2: ConfigArticleCode.ARTICLE_TIMEHOURS_ABSENCE
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureTotalIncomeArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_FINAL;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_INCOME_GROSS, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_INCOME_NETTO, catg: configCategory,
                        pendings: PendingArticleNames9(
                        ConfigArticleCode.ARTICLE_INCOME_GROSS,
                                code2: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_TOTAL,
                                code3: ConfigArticleCode.ARTICLE_TAXING_BONUS_CHILD,
                                code4: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_GENERAL,
                                code5: ConfigArticleCode.ARTICLE_HEALTH_EMPLOYEE_GENERAL,
                                code6: ConfigArticleCode.ARTICLE_HEALTH_EMPLOYEE_MANDATORY,
                                code7: ConfigArticleCode.ARTICLE_SOCIAL_EMPLOYEE_GENERAL,
                                code8: ConfigArticleCode.ARTICLE_SOCIAL_EMPLOYEE_PENSION,
                                code9: ConfigArticleCode.ARTICLE_GARANT_EMPLOYEE_PENSION
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureNettoDeductsArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_TOTAL, catg: configCategory,
                        pendings: PendingArticleNames2(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_GENERAL,
                                code2: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_SOLIDARY
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_BASIS_GENERAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_SOLIDARY, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_BASIS_SOLIDARY
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_BASIS_GENERAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_EMPLOYEE_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_HEALTH_BASIS_GENERAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_EMPLOYEE_MANDATORY, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_HEALTH_BASIS_MANDATORY
                        )),
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_EMPLOYEE_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SOCIAL_BASIS_GENERAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_EMPLOYEE_PENSION, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SOCIAL_BASIS_PENSION
                        )),
                Article(code: ConfigArticleCode.ARTICLE_GARANT_EMPLOYEE_PENSION, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_GARANT_BASIS_PENSION
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureBasisHealthArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_INCOME_SUBJECT, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_INCOME_PARTICIP, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_HEALTH_INCOME_SUBJECT
                        )),
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_BASIS_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_HEALTH_INCOME_PARTICIP
                        )),
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_BASIS_MANDATORY, catg: configCategory,
                        pendings: PendingArticleNames2(
                        ConfigArticleCode.ARTICLE_HEALTH_BASIS_GENERAL,
                                code2: ConfigArticleCode.ARTICLE_HEALTH_INCOME_PARTICIP
                        )),
                Article(code: ConfigArticleCode.ARTICLE_HEALTH_BASIS_LEGALCAP, catg: configCategory,
                        pendings: PendingArticleNames2(
                        ConfigArticleCode.ARTICLE_HEALTH_BASIS_GENERAL,
                                code2: ConfigArticleCode.ARTICLE_HEALTH_INCOME_PARTICIP
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureBasisSocialArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_INCOME_SUBJECT, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_INCOME_PARTICIP, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SOCIAL_INCOME_SUBJECT
                        )),
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_BASIS_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SOCIAL_INCOME_PARTICIP
                        )),
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_BASIS_PENSION, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SOCIAL_INCOME_PARTICIP
                        )),
                Article(code: ConfigArticleCode.ARTICLE_SOCIAL_BASIS_LEGALCAP, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_SOCIAL_INCOME_PARTICIP
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureBasisGarantArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_GARANT_INCOME_SUBJECT, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_GARANT_INCOME_PARTICIP, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_GARANT_INCOME_SUBJECT
                        )),
                Article(code: ConfigArticleCode.ARTICLE_GARANT_BASIS_PENSION, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_GARANT_INCOME_PARTICIP
                        )),
                Article(code: ConfigArticleCode.ARTICLE_GARANT_BASIS_LEGALCAP, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_GARANT_INCOME_PARTICIP
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureBasisTaxingArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_TAXING_INCOME_SUBJECT, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_INCOME_HEALTH, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_INCOME_SOCIAL, catg: configCategory,
                        pendings: EMPTY_PENDING_NAMES)
        ];
        return articleArray;
    }

    private static func ConfigureBasisAdvancesArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_INCOME, catg: configCategory,
                        pendings: PendingArticleNames1 (
                        ConfigArticleCode.ARTICLE_TAXING_INCOME_SUBJECT
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_HEALTH, catg: configCategory,
                        pendings: PendingArticleNames1 (
                        ConfigArticleCode.ARTICLE_TAXING_INCOME_HEALTH
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_SOCIAL, catg: configCategory,
                        pendings: PendingArticleNames1 (
                        ConfigArticleCode.ARTICLE_TAXING_INCOME_SOCIAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_BASIS_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames3 (
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_INCOME,
                                code2: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_HEALTH,
                                code3: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_SOCIAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_BASIS_SOLIDARY, catg: configCategory,
                        pendings: PendingArticleNames1 (
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_BASIS_GENERAL
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureBasisWithholdArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_INCOME, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_INCOME_SUBJECT
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_HEALTH, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_INCOME_HEALTH
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_SOCIAL, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_INCOME_SOCIAL
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_BASIS_GENERAL, catg: configCategory,
                        pendings: PendingArticleNames3(
                        ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_INCOME,
                                code2: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_HEALTH,
                                code3: ConfigArticleCode.ARTICLE_TAXING_WITHHOLD_SOCIAL
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureAllowanceTaxisArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_PAYER, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_INCOME
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_DISABILITY, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_INCOME
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_STUDYING, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_INCOME
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_CHILD, catg: configCategory,
                        pendings: PendingArticleNames1(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_INCOME
                        ))
        ];
        return articleArray;
    }

    private static func ConfigureRebateTaxisArticles() -> Array<Article>
    {
        let configCategory : ProcessCategory = ProcessCategory.CATEGORY_NETTO;

        let articleArray = [
                Article(code: ConfigArticleCode.ARTICLE_TAXING_REBATE_PAYER, catg: configCategory,
                        pendings: PendingArticleNames4(
                        ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_PAYER,
                                code2: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_TOTAL,
                                code3: ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_DISABILITY,
                                code4: ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_STUDYING
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_REBATE_CHILD, catg: configCategory,
                        pendings: PendingArticleNames3(
                        ConfigArticleCode.ARTICLE_TAXING_ALLOWANCE_CHILD,
                                code2: ConfigArticleCode.ARTICLE_TAXING_ADVANCES_TOTAL,
                                code3: ConfigArticleCode.ARTICLE_TAXING_REBATE_PAYER
                        )),
                Article(code: ConfigArticleCode.ARTICLE_TAXING_BONUS_CHILD, catg: configCategory,
                        pendings: PendingArticleNames3(
                        ConfigArticleCode.ARTICLE_TAXING_ADVANCES_TOTAL,
                                code2: ConfigArticleCode.ARTICLE_TAXING_REBATE_PAYER,
                                code3: ConfigArticleCode.ARTICLE_TAXING_REBATE_CHILD
                        ))
        ];
        return articleArray;
    }

    public static func PendingArticleNames1(code1: ConfigArticleCode) -> Array<ConfigArticleCode>
    {
        return [ code1 ];
    }
    public static func PendingArticleNames2(code1: ConfigArticleCode, code2: ConfigArticleCode) -> Array<ConfigArticleCode>
    {
        return [ code1, code2 ];
    }
    public static func PendingArticleNames3(code1: ConfigArticleCode, code2: ConfigArticleCode, code3: ConfigArticleCode) -> Array<ConfigArticleCode>
    {
        return [ code1, code2, code3 ];
    }
    public static func PendingArticleNames4(code1: ConfigArticleCode, code2: ConfigArticleCode, code3: ConfigArticleCode, code4: ConfigArticleCode) -> Array<ConfigArticleCode>
    {
        return [ code1, code2, code3, code4 ];
    }
    public static func PendingArticleNames5(code1: ConfigArticleCode, code2: ConfigArticleCode, code3: ConfigArticleCode, code4: ConfigArticleCode,
                                     code5: ConfigArticleCode) -> Array<ConfigArticleCode>
    {
        return [ code1, code2, code3, code4, code5 ];
    }
    public static func PendingArticleNames9(code1: ConfigArticleCode, code2: ConfigArticleCode, code3: ConfigArticleCode, code4: ConfigArticleCode,
                                     code5: ConfigArticleCode, code6: ConfigArticleCode, code7: ConfigArticleCode, code8: ConfigArticleCode, code9: ConfigArticleCode) -> Array<ConfigArticleCode>
    {
        return [ code1, code2, code3, code4, code5, code6, code7, code8, code9 ];
    }
}

