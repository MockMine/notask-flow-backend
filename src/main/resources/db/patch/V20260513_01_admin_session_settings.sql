INSERT INTO nt_system_setting (setting_key, setting_value, description)
SELECT 'auth.token.web-access-seconds', '14400', 'Web访问令牌有效秒数'
WHERE NOT EXISTS (
    SELECT 1 FROM nt_system_setting WHERE setting_key = 'auth.token.web-access-seconds' AND is_deleted = 0
);

INSERT INTO nt_system_setting (setting_key, setting_value, description)
SELECT 'auth.token.admin-access-seconds', '7200', '管理端访问令牌有效秒数'
WHERE NOT EXISTS (
    SELECT 1 FROM nt_system_setting WHERE setting_key = 'auth.token.admin-access-seconds' AND is_deleted = 0
);

INSERT INTO nt_system_setting (setting_key, setting_value, description)
SELECT 'auth.token.mobile-access-seconds', '3600', '移动端访问令牌有效秒数'
WHERE NOT EXISTS (
    SELECT 1 FROM nt_system_setting WHERE setting_key = 'auth.token.mobile-access-seconds' AND is_deleted = 0
);
