export default function handler(req, res) {
  res.status(200).json({
    message: "775c9e13816177a589b8",
    timestamp: new Date().toISOString(),
  });
}