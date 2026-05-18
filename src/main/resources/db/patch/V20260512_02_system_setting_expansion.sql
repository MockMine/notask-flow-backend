ALTER TABLE nt_space
  ADD COLUMN join_approval_required tinyint(1) NOT NULL DEFAULT 1 COMMENT '加入空间是否需要审核' AFTER owner_user_id;

INSERT INTO nt_system_setting (setting_key, setting_value, description, is_deleted)
VALUES
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
