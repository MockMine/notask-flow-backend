CREATE TABLE IF NOT EXISTS `nt_system_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '系统设置标识',
  `setting_key` varchar(80) NOT NULL COMMENT '设置键',
  `setting_value` varchar(200) NOT NULL COMMENT '设置值',
  `description` varchar(255) DEFAULT NULL COMMENT '设置说明',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_system_setting_key_deleted` (`setting_key`, `is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统设置表';

INSERT INTO nt_system_setting (setting_key, setting_value, description, is_deleted)
VALUES
  ('auth.registration.enabled', 'true', '是否开放新用户注册', 0),
  ('auth.registration.email-verification-required', 'true', '注册是否必须验证邮箱', 0),
  ('auth.login.single-device-only', 'true', '是否仅允许同一账号单设备登录', 0),
  ('mail.enabled', 'true', '是否启用邮件发送', 0),
  ('auth.login.failure-limit', '10', '登录失败锁定阈值', 0),
  ('auth.login.failure-window-minutes', '5', '登录失败锁定窗口分钟数', 0),
  ('note.share.enabled', 'true', '是否允许公开分享笔记', 0),
  ('note.share.default-expire-minutes', '10080', '分享链接默认过期分钟数，0表示永不过期', 0),
  ('note.history.max-versions', '20', '笔记历史最大版本数', 0),
  ('collab.ticket-expire-seconds', '60', '协作Ticket过期秒数', 0),
  ('space.join.default-require-approval', 'true', '新团队默认是否需要审核加入', 0)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  is_deleted = 0;
