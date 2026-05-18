CREATE TABLE IF NOT EXISTS `nt_user_device_token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备推送令牌标识',
  `user_id` bigint NOT NULL COMMENT '用户标识',
  `platform` varchar(20) NOT NULL COMMENT '推送平台',
  `provider` varchar(20) NOT NULL DEFAULT 'FCM' COMMENT '推送服务提供商',
  `device_id` varchar(100) NOT NULL COMMENT '设备标识',
  `device_name` varchar(120) DEFAULT NULL COMMENT '设备名称',
  `device_token` varchar(1024) NOT NULL COMMENT '设备推送令牌',
  `app_version` varchar(40) DEFAULT NULL COMMENT '应用版本',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `last_active_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近活跃时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_device_token_user_platform` (`user_id`, `platform`, `enabled`, `is_deleted`),
  KEY `idx_user_device_token_device` (`user_id`, `platform`, `device_id`, `is_deleted`),
  KEY `idx_user_device_token_token` (`platform`, `device_token`(191), `enabled`, `is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户移动端推送设备令牌表';
